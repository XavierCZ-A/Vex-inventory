class StockMovement < ApplicationRecord
  acts_as_tenant(:organization)

  enum :movement_type, {
    initial: 0,
    adjustment: 1,
    sale: 2,
    purchase: 3,
    transfer_in: 4,
    transfer_out: 5
  }

  # Associations
  belongs_to :product
  belongs_to :warehouse, optional: true
  belongs_to :user, default: -> { Current.user }
  belongs_to :organization

  # Validators
  validates :quantity_change, presence: true
  validates :movement_date, presence: true
  validates :organization_id, presence: true
  validates :product_id, presence: true
  validates :movement_type, presence: true
end
