class Supplier < ApplicationRecord
  validates :company_name, presence: true, length: { minimum: 2 }, format: {
    with: /\A[a-zA-Z]+\z/,
    message: :invalid
  }
  validates :supplier_name, presence: true, length: { minimum: 2 }, format: {
    with: /\A[a-zA-Z\s]+\z/,
    message: :invalid
  }
  validates :supplier_phone, presence: true, length: { maximum: 10 }
  validates :supplier_email, presence: true, uniqueness: true, format: {
    with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
    message: :invalid
  }
  validates :supplier_address, presence: true
end
