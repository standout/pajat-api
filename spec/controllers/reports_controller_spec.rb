require 'rails_helper'

RSpec.describe ReportsController, type: :controller do
  describe 'creation' do
    it 'creates a report' do
      expect { create_report }.to change { Report.count }
    end

    it 'responds successfully' do
      expect(response).to be_successful
    end

    it 'should fetch ip from agent' do
      request.env['REMOTE_ADDR'] = '123.456.789.0'
      create_report
      expect(Report.last.agent_ip).to eq('123.456.789.0')
    end
  end

  describe 'listing latest' do
    before(:context) do
      40.times { Report.create! valid_create_params }
    end

    it 'responds successfully' do
      list_reports
      expect(response).to be_successful
    end

    it 'lists the 30 latest reports' do
      list_reports
      expect(json_response.size).to eq(30)
    end
  end

  context 'GET /reports/near/:lat/:long.json' do
    before do
      Report.destroy_all
      3.times do
        Report.create! valid_create_params
        Report.create! far_away_create_params
      end
    end

    it 'lists only reports near location' do
      get :index, latitude: 56.878333, longitude: 14.809167
      expect(json_response.size).to eq(3)
      expect(json_response.first['latitude']).to eq(56.878333)
    end
  end

  def valid_create_params
    {
      latitude: 56.878333,
      longitude: 14.809167,
      description: 'test',
      agent: 'testbot 0.1.2',
      reporter_network: 'twitter',
      reporter_username: 'davidelbe',
      source_url: 'https://twitter.com/davidelbe/status/677746564341833728',
      image_url: 'https://example.com/1723640659/chimp_bigger.png'
    }
  end

  # For a city that is far away from our
  # original location
  def far_away_create_params
    valid_create_params
      .merge(
        latitude: 57.301263,
        longitude: 13.5130047,
        description: 'Far away'
      )
  end

  def list_reports
    get :index
  end

  def create_report
    post "create", report: valid_create_params
  end
end
