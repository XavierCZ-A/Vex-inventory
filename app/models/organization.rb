class Organization < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :customers, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :warehouses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :suppliers, dependent: :destroy

  accepts_nested_attributes_for :users

  validates :name, presence: true, length: { minimum: 2 }, format: {
    with: /\A[a-zA-Z0-9\s]+\z/,
    message: :invalid
  }
end
