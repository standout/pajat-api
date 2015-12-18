class ReportsController < ApplicationController

  def create
    @report = Report.new report_create_params
    if @report.save
      render json: @report
    else
      render json: @report, status: 422
    end
  end

  protected

  def report_create_params
    params
      .require(:report)
      .permit(
        :latitude,
        :longitude,
        :description
      )
  end
end
