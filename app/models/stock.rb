class Stock < ApplicationRecord
  acts_as_tenant(:organization)
  before_validation :set_entry_date, on: :create


  # Associations
  belongs_to :product, optional: true
  belongs_to :warehouse
  belongs_to :organization

  # Validators
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :entry_date, presence: true
  validates :warehouse_id, presence: true


  # Scopes
  scope :total_stock, -> { sum(:quantity) }

  private

  def set_entry_date
    self.entry_date ||= Date.current
  end
end
