class Stock < ApplicationRecord
  acts_as_tenant(:organization)

  after_create :initial_stock_movement
  after_update :adjustment_stock_movement

  # Associations
  belongs_to :product, optional: true
  belongs_to :warehouse, optional: true
  belongs_to :organization

  # Validators
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :warehouse_id, presence: true
  validates :product_id, presence: true


  # Scopes
  scope :total_stock, -> { sum(:quantity) }

  private

  def initial_stock_movement
    if self.quantity > 0
      create_stock_movement(self.quantity, :initial)
    end
  end

  def adjustment_stock_movement
    if saved_change_to_quantity?
      difference = self.quantity - self.quantity_before_last_save
      if difference != 0
        create_stock_movement(difference, :adjustment)
      end
    end
  end

  def create_stock_movement(qty_change, movement_type)
    StockMovement.create!(
      product: self.product,
      warehouse: self.warehouse,
      quantity_change: qty_change,
      movement_date: Time.now,
      organization: self.organization,
      user: Current.user,
      movement_type: movement_type
    )
  end
end
