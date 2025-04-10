class User < ApplicationRecord
  has_secure_password

  acts_as_tenant(:organization)

  enum :role, {
    admin: 0,
    employee: 1
  }

  has_many :sessions, dependent: :destroy
  belongs_to :organization
  has_many :sent_invitations, class_name: "Invitation", foreign_key: "sender_id", dependent: :destroy


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

  scope :organization_users, -> { where(organization: Current.organization) }
  scope :employee, -> { where(role: :employee) }

  def full_name
    full_names = "#{name} #{last_name}"
    full_names.capitalize
  end
end
