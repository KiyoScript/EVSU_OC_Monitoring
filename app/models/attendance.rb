class Attendance < ApplicationRecord
  belongs_to :attendable, polymorphic: true

  def fullname
    "#{attendable.last_name.capitalize}, #{attendable.given_name.capitalize} #{attendable.middle_name.first.capitalize}."
  end

  def department_or_program
    if attendable.respond_to?(:program) && attendable.program.present?
      attendable.program
    else
      attendable.department.name
    end
  end


  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end

  def self.record_attendance(person)
    attendance = person.attendances.where(date: Date.current).last
    if attendance.nil? || attendance&.time_out.present?
      attendance = person.attendances.create(name: person.fullname, date: Date.current, time_in: Time.now)
      return :time_in
    else
      attendance.update(time_out: Time.current)
      return :time_out
    end
  end
end
