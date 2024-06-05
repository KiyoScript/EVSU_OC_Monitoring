class Student < ApplicationRecord
  validates :student_id, :last_name, :given_name, :middle_name, :gender, :program, presence: true
  validates :rfid, uniqueness: true

  enum gender: { male: 0, female: 1 }

  def self.ransackable_attributes(auth_object = nil)
    ["last_name"]
  end
end
