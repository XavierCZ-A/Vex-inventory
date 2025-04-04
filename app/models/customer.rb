class Customer < ApplicationRecord
  acts_as_tenant(:organization)

  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true
end
