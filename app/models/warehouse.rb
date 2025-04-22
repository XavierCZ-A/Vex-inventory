class Warehouse < ApplicationRecord
  acts_as_tenant(:organization)

  # Associations
  has_many :stocks
  has_many :products, through: :stocks
  has_many :stock_movements, dependent: :destroy
  belongs_to :organization

  # Validators
  validates :name, presence: true, length: { minimum: 2 }
  validates :address, presence: true, format: {
    with: /\A[a-zA-Z0-9\s\-\.,#]+\z/,
    message: :invalid
  }
  validates :capacity, presence: true

  def self.total_stock
    joins(:stocks).sum(:quantity)
  end

  def total_stock
    stocks.sum(:quantity) || 0
  end

  def ocupacity_percentage
    ((total_stock.to_f / capacity) * 100).round(2)
  end
end
