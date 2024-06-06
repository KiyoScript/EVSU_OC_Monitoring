class Employee < ApplicationRecord
  belongs_to :department
  has_many :attendances, as: :attendable

  validates :employee_id, :last_name, :given_name, :middle_name, :gender, presence: true
  validates :rfid, uniqueness: true

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
    if Student.exists?(rfid: rfid)
      errors.add(:rfid, 'has already been taken')
    end
  end
end
