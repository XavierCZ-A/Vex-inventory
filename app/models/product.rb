require "csv"

class Product < ApplicationRecord
  acts_as_tenant(:organization)

  # Associations
  belongs_to :category
  has_many :stocks
  has_many :warehouses, through: :stocks
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items
  belongs_to :organization

  accepts_nested_attributes_for :stocks, allow_destroy: true, reject_if: :all_blank

  # Validators
  validates :name, presence: true, format: {
    with: /\A[a-zA-Z0-9 ]+\z/,
    message: :invalid
  }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :category_id, presence: true

  scope :total_products_price, -> { sum(:price) }
  scope :order_by_date, -> { order(created_at: :desc) }

  def self.to_csv
    products = all.includes(:category)
    CSV.generate(headers: true) do |csv|
      headers = column_names - [ "category_id" ] + [ "category_name" ]
      csv << headers
      products.each do |product|
        values = product.attributes.except("category_id").values
        values << product.category&.name
        csv << values
      end
    end
  end
end
