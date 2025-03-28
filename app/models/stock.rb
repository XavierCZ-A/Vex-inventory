class Stock < ApplicationRecord
  # Associations
  belongs_to :product
  belongs_to :warehouse

  # Validators
  validates :quantity, presence: true, numericality: true
  validates :entry_date, presence: true
  validates :product_id, presence: true
  validates :warehouse_id, presence: true

  # Scopes
  scope :total_stock, -> { sum(:quantity) }
end
