class AttendancesController < ApplicationController
  def index
    @filtered_attendances = Attendance.ransack(params[:q])
    @pagy, @attendances = pagy(@filtered_attendances.result.order(created_at: :asc), items: 10)
  end

  def create
    person = Student.find_by(rfid: params.dig(:attendance, :rfid)) || Employee.find_by(rfid: params.dig(:attendance, :rfid))
    if person.nil?
      redirect_to attendances_path, alert: "Account not found"
    else
      result = Attendance.record_attendance(person)
      if result == :time_in
        redirect_to attendances_path, notice: "Time in successfully"
      else
        redirect_to attendances_path, notice: "Time out successfully"
      end
    end
  end

  private

  # def person_information(person)
  #   {
  #     identification: person.respond_to?(:student_id) ? person.student_id : person.employee_id,
  #     name: person.fullname,
  #     gender: person.gender,
  #     department_or_program: person.respond_to?(:program) ? person.program : person.person.department.name
  #   }
  # end
end
