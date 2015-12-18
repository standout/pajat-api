require 'rails_helper'

RSpec.describe ReportsController, type: :controller do
  describe 'creation' do
    it 'should be created' do
      expect do
        post "create",
             report: {
               latitude: 18,
               longitude: 20,
               description: 'test'
             }
      end.to change { Report.count }
      expect(response).to be_successful
    end
  end
end
