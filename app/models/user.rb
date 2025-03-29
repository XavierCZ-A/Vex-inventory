class User < ApplicationRecord
  has_secure_password

  acts_as_tenant(:organization)

  enum :role, {
    super_admin: 0,
    admin: 1
  }

  has_many :sessions, dependent: :destroy
  belongs_to :organization

  validates :email_address, presence: true, uniqueness: true, format: {
    with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
    message: :invalid
  }
  validates :name, presence: true, length: { minimum: 3 }, format: {
    with: /\A[a-zA-Z\s]+\z/,
    message: :invalid
  }
  validates :last_name, presence: true, length: { minimum: 3 }, format: {
    with: /\A[a-zA-Z\s]+\z/,
    message: :invalid
  }
  validates :password, presence: true, length: { minimum: 6 }

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
