require 'rails_helper'

RSpec.describe ReportsController, type: :controller do
  describe 'creation' do
    it 'creates a report' do
      expect { create_report }.to change { Report.count }
      expect(response).to be_successful
    end

    it 'should fetch ip from agent' do
      request.env['REMOTE_ADDR'] = '123.456.789.0'
      create_report
      expect(Report.last.agent_ip).to eq('123.456.789.0')
    end
  end

  describe 'listing' do
    before(:context) do
      40.times { Report.create! attributes_for(:report) }
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

  def list_reports
    get :index
  end

  def create_report
    post :create, report: attributes_for(:report)
  end
end
