class StudentImportService
  def initialize(file)
    @file = file
  end

  def import
    csv_data = CSV.read(@file.path, headers: true, skip_blanks: true, encoding: 'utf-8')
    csv_data = csv_data.drop(0)
    parallel_import(csv_data)
  end

  private

  def parallel_import(csv_data)
    Parallel.each(csv_data, in_threads: 4) do |row|
      student_id = row[0]

      next if Student.where(student_id: student_id).exists?

      student_attributes = {
        student_id: student_id,
        last_name: row[1],
        given_name: row[2],
        middle_name: row[3],
        gender: row[4] == "M" ? 0 : 1,
        program: row[5]
      }
      Student.create!(student_attributes)
    end
  end
end
