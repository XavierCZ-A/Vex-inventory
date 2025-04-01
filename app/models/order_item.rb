class OrderItem < ApplicationRecord
  acts_as_tenant(:organization)

  belongs_to :order
  belongs_to :product
end
