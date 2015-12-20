class ReportsController < ApplicationController
  def create
    @report = Report.new report_create_params
    @report.agent_ip = request.headers['X-Forwarded-For'] ||
                       request.headers['REMOTE_ADDR']
    if @report.save
      render json: @report
    else
      render json: @report, status: 422
    end
  end

  def index
    @reports = Report.all.limit(30)
    render json: @reports
  end

  protected

  def report_create_params
    params.require(:report).permit(
      :latitude,
      :longitude,
      :description,
      :agent,
      :reporter_network,
      :reporter_username,
      :source_url,
      :image_url
    )
  end
end
