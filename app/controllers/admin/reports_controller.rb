# app/controllers/admin/reports_controller.rb

  class Admin::ReportsController < AdminController
    before_action :authenticate_user!
    before_action :verify_admin
    before_action :set_report, only: [:show, :destroy]

    def index
      @admin_reports = Report.all
    end

    def show
    end

    def destroy
      @admin_report.destroy
      redirect_to admin_reports_path, notice: 'Report was successfully destroyed.'
    end

    private

    def set_report
      @admin_report = Report.find(params[:id])
    end

    def verify_admin
      redirect_to root_path, alert: 'Access denied' unless current_user.admin?
    end
  end

