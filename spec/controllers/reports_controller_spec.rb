require 'rails_helper'

RSpec.describe ReportsController, type: :controller do
  describe 'creation' do
    it 'creates a report' do
      expect { create_report }.to change { Report.count }
    end

    it 'responds successfully' do
      expect(response).to be_successful
    end
  end

  describe 'listing' do
    before(:context) do
      40.times { Report.create valid_create_params }
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

  def valid_create_params
    {
      latitude: 18,
      longitude: 20,
      description: 'test',
      agent: 'testbot 0.1.2',
      reporter_network: 'twitter',
      reporter_username: 'davidelbe',
      source_url: 'https://twitter.com/azazell0/status/113728077904871424',
      image_url: 'https://example.com/1723640659/chimp_bigger.png'
    }
  end

  def list_reports
    get :index
  end

  def create_report
    post "create", report: valid_create_params
  end
end
