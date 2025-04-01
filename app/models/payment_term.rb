class PaymentTerm < ApplicationRecord
  has_many :orders, dependent: :destroy

  scope :active, -> { where(active: true) }
end
