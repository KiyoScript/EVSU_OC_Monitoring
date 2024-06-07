class AttendancesController < ApplicationController
  before_action :set_person, only: %i[show]
  def index
    @filtered_attendances = attendances.ransack(params[:q])
    @pagy, @attendances = pagy(@filtered_attendances.result.order(created_at: :asc), items: 20)
  end

  def create
    person = Student.find_by(rfid: params.dig(:attendance, :rfid)) || Employee.find_by(rfid: params.dig(:attendance, :rfid))
    if person.nil?
      redirect_to attendances_path, alert: "Account not found"
    else
      result = Attendance.record_attendance(person)
      if result == :time_in
        redirect_to attendance_path(person.respond_to?(:student_id) ? person.student_id : person.employee_id), notice: "Time in successfully"
      else
        redirect_to attendances_path, notice: "Time out successfully"
      end
    end
  end

  def show;end

  private
  def set_person
    @person = Student.find_by(student_id: params[:id]) || Employee.find_by(employee_id: params[:id])
  end

  def attendances
    return Attendance.all if params[:date] != 'current'

    Attendance.where(date: Date.current)
  end
end
