require 'csv'
require 'parallel'

class EmployeeImportService
  def initialize(file)
    @file = file
  end

  def import
    csv_data = CSV.read(@file.path, headers: true, skip_blanks: true, encoding: 'utf-8')
    csv_data = csv_data.drop(1)
    parallel_import(csv_data)
  end

  private

  def parallel_import(csv_data)
    Parallel.each(csv_data, in_threads: 4) do |row|
      employee_id = row[0]

      next if Employee.where(employee_id: employee_id).exists?

      department_name = row[5].strip
      department = find_or_create_department(department_name)

      employee_attributes = {
        employee_id: employee_id,
        last_name: row[1],
        given_name: row[2],
        middle_name: row[3],
        gender: row[4] == "M" ? 0 : 1,
        department: department
      }

      Employee.create!(employee_attributes)
    end
  end

  def find_or_create_department(department_name)
    name = department_name.strip.downcase
    Department.where('LOWER(TRIM(name)) = ?', name).first_or_create(name: department_name.strip)
  end
end
