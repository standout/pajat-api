require 'rails_helper'

RSpec.describe ReportsController, type: :controller do
  describe 'creation' do
    it 'should be created' do
      expect do
        post "create", report: valid_create_params
      end.to change { Report.count }
      expect(response).to be_successful
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
end