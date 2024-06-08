class ReportController < ApplicationController

  def show
    @attendances = case params[:range]
    when "daily"
      Attendance.where(date: Date.current)
    when "weekly"
      Attendance.where(date: Date.current.beginning_of_week..Date.current.end_of_week)
    when "monthly"
      Attendance.where(date: Date.current.beginning_of_month..Date.current.end_of_month)
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

end
