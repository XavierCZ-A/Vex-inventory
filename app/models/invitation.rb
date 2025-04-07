class Invitation < ApplicationRecord
  acts_as_tenant(:organization)

  enum :status, { pending: 0, accepted: 1, rejected: 2 }

  belongs_to :recipient, class_name: "User", optional: true
  belongs_to :organization

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true, length: { minimum: 3 }, format: { with: /\A[a-zA-Z\s]+\z/ }

  validates :email, uniqueness: {
    scope: [ :organization_id, :status ],
    conditions: -> { where(status: :pending) },
    message: "ya tiene una invitación pendiente para esta organización."
  }

  generates_token_for :invitation, expires_in: 7.days do
    status
  end

  def full_name
    "#{recipient&.name} #{recipient&.last_name}"
  end
end
