class Department < ApplicationRecord
  validates :name,  presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
