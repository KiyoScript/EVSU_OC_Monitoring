class EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employee, only: %i[edit update destroy]

  def index
    respond_to do |format|
      format.html {
        @filtered_employees = Employee.ransack(params[:q])
        @pagy, @employees = pagy(@filtered_employees.result.order(created_at: :desc), items: 10)
      }
    end
  end

  def new
    @employee = Employee.new
    @departments = Department.all
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employees_path, notice: "Successfully created"
    else
      redirect_to new_employee_path, alert: @employee.errors.full_messages.first
    end
  end

  def edit
    @departments = Department.all
  end

  def update
    if @employee.update(employee_params)
      redirect_to employees_path, notice: "#{@employee.last_name} successfully updated"
    else
      redirect_to edit_employee_path(@employee), alert: @employee.errors.full_messages.first
    end
  end

  def destroy
    if @employee.destroy
      redirect_to employees_path, notice: "Employee Successfully removed"
    else
      redirect_to employees_path, alert: @employee.errors.full_messages.first
    end
  end

  private
  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(
      :employee_id,
      :rfid,
      :last_name,
      :given_name,
      :middle_name,
      :gender,
      :department_id
    )
  end
end
