class Warehouse < ApplicationRecord
  acts_as_tenant(:organization)

  # Associations
  has_many :stocks
  has_many :products, through: :stocks
  belongs_to :organization

  # Validators
  validates :name, presence: true, length: { minimum: 2 }
  validates :address, presence: true, format: {
    with: /\A[a-zA-Z0-9\s\-\.,#]+\z/,
    message: :invalid
  }
  validates :capacity, presence: true

  def ocupacity_percentage
    # Obtener el total de stock
    total_stock = stocks.sum(:quantity) || 0

    # Obtener la capacidad del warehouse directamente desde el modelo
    ((total_stock.to_f / capacity) * 100).round(2)
  end
end
