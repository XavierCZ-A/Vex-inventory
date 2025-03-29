class Stock < ApplicationRecord
  acts_as_tenant(:organization)

  # Associations
  belongs_to :product
  belongs_to :warehouse
  belongs_to :organization

  # Validators
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :entry_date, presence: true
  validates :product_id, presence: true
  validates :warehouse_id, presence: true

  # Scopes
  scope :total_stock, -> { sum(:quantity) }
end
