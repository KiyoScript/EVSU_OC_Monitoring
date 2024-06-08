class Student < ApplicationRecord
  has_many :attendances, as: :attendable, dependent: :destroy
  has_one_attached :avatar
  before_update :set_rfid_confirmation_email
  after_update :rfid_confirmation_email
  
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
      return unless rfid_changed?

      if Student.find_by(rfid: rfid) || Employee.find_by(rfid: rfid)
        errors.add(:rfid, 'has already been taken')
      end
    end

    def set_rfid_confirmation_email
      return unless rfid_changed?
      @rfid_confirmation_email = RfidNotification.rfid_updated(self)
    end

    def rfid_confirmation_email
      @rfid_confirmation_email&.deliver_now
    end
end
