#
class ReportsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index, :show, :destroy]
  def index
    @reports = Report.new
  end

  def new
    @report = Report.new
  end

  

  def create
    @report = current_user.reports.build(report_params)
    if @report.save
      redirect_to root_path, notice: 'Your report has been submitted successfully.'
    else
      render :new
    end
  end

  private

  def report_params
    params.require(:report).permit(:title, :content)
  end
end
