class Student < ApplicationRecord
  has_many :attendances, as: :attendable

  validates :student_id, :last_name, :given_name, :middle_name, :gender, :program, presence: true

  validate :unique_rfid_across_models

  enum gender: { male: 0, female: 1 }

  def fullname
    "#{last_name.capitalize}, #{given_name.capitalize} #{middle_name.first.capitalize}"
  end

  def self.ransackable_attributes(auth_object = nil)
    ["last_name"]
  end


  private
  def unique_rfid_across_models
    if Student.pluck(:rfid).compact_blank!.include?(rfid) || Employee.pluck(:rfid).compact_blank!.include?(rfid)
      errors.add(:rfid, 'has already been taken')
    end
  end
end
