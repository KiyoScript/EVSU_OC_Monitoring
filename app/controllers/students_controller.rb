class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student, only: %i[edit update destroy]

  def index
    respond_to do |format|
      format.html {
        @filtered_students = Student.ransack(params[:q])
        @pagy, @students = pagy(@filtered_students.result.order(created_at: :desc), items: 10)
      }
    end
  end

  def new
    @student = Student.new
  end

  def create
    respond_to do |format|
      @student = Student.new(student_params)
      if @student.save
        format.html { redirect_to students_path, notice: "Successfully created" }
      else
        format.html { redirect_to new_student_path, alert: @student.errors.full_messages.first }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to students_path, notice: "#{@student.last_name} successfully updated" }
      else
        format.html { redirect_to edit_student_path(@student), alert: @student.errors.full_messages.first }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @student.destroy
        format.html{ redirect_to students_path, notice: "Student Successfully removed" }
      else
        format.html { redirect_to students_path, alert: @student.errors.full_messages.first }
      end
    end
  end

  def import
    file = params[:file]
    if file.nil?
      flash[:error] = "Please upload a CSV file."
      redirect_to students_path and return
    end
    begin
      StudentImportService.new(file).import
      redirect_to students_path, notice: "Students imported successfully."
    rescue => e
      flash[:error] = "#{e.message}"
      redirect_to students_path
    end
  end

  private

  def set_student
    @student = Student.find_by_id(params[:id])
  end

  def student_params
    params.require(:student).permit(
      :student_id,
      :rfid,
      :last_name,
      :given_name,
      :middle_name,
      :gender,
      :program
    )
  end
end
