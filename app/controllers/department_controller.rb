class DepartmentController < ApplicationController
  before_action :authenticate_user!
  before_action :set_department, only: %i[edit update destroy]


  def index
    respond_to do |format|
      format.html {
        @filtered_departments = Department.ransack(params[:q])
        @pagy, @departments = pagy(@filtered_departments.result.order(created_at: :asc), items: 10)
      }
    end
  end

  def new
    @department = Department.new
  end

  def create
    respond_to do |format|
      @department = Department.new(department_params)
      if @department.save
        format.html { redirect_to department_index_path, notice: "Successfully created" }
      else
        format.html { redirect_to new_department_path, alert: @department.errors.full_messages.first }
      end
    end
  end

  def edit;end

  def update
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to department_index_path, notice: "Successfully updated" }
      else
        format.html { redirect_to edit_department_path(@department), alert: @department.errors.full_messages.first }
      end
    end
  end


  def destroy
    respond_to do |format|
      if @department.destroy
        format.html{ redirect_to department_index_path, notice: "Department Successfully removed"}
      else
        format.html { redirect_to department_index_path, alert: @department.errors.full_messages.first }
      end
    end
  end

  private
  def set_department
    @department = Department.find_by_id(params[:id])
  end

  def department_params
    params.require(:department).permit(:name)
  end
end
