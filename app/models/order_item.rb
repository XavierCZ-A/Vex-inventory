class OrderItem < ApplicationRecord
  acts_as_tenant(:organization)

  # Associations
  belongs_to :order
  belongs_to :product
  belongs_to :organization
end
