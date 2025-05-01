class User < ApplicationRecord
  has_secure_password
  acts_as_tenant(:organization)

  before_create :set_is_activate

  enum :role, {
    admin: 0,
    employee: 1
  }

  has_many :sessions, dependent: :destroy
  belongs_to :organization
  has_many :sent_invitations, class_name: "Invitation", foreign_key: "sender_id", dependent: :destroy
  has_many :stock_movements


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
  validates :password, presence: true, length: { minimum: 6 }, if: :password_digest_changed?

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  normalizes :name, with: ->(n) { n.strip.capitalize }
  normalizes :last_name, with: ->(n) { n.strip.capitalize }

  scope :organization_users, -> { where(organization: Current.organization) }
  scope :employee, -> { where(role: :employee) }

  def full_name
    full_names = "#{name} #{last_name}"
    full_names.capitalize
  end

  private

  def set_is_activate
    self.is_activate = true
  end
end
