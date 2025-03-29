class Organization < ApplicationRecord
  has_many :users, dependent: :destroy
  accepts_nested_attributes_for :users

  validates :name, presence: true, length: { minimum: 2 }, format: {
    with: /\A[a-zA-Z\s]+\z/,
    message: :invalid
  }
end
