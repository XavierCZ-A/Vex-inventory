class Product < ApplicationRecord
  # Associations
  belongs_to :category
  has_many :stocks
  has_many :warehouses, through: :stocks

  # Validators
  validates :name, presence: true, format: {
    with: /\A[a-zA-Z0-9]+\z/,
    message: :invalid
  }
  validates :price, presence: true, numericality: true
  validates :category_id, presence: true
end
