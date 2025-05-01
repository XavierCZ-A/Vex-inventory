class Stock < ApplicationRecord
  acts_as_tenant(:organization)

  after_create :initial_stock_movement
  after_update :adjustment_stock_movement

  # Associations
  belongs_to :product, inverse_of: :stocks
  belongs_to :warehouse
  belongs_to :organization

  # Validators
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :warehouse_id, presence: true
  validates :product, presence: true

  # Scopes
  scope :total_stock, -> { sum(:quantity) }

  private

  def initial_stock_movement
    if self.quantity > 0
      movement_type = initial_movement_type
      create_stock_movement(self.quantity, movement_type)
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

  def initial_movement_type
    has_previous_movements = StockMovement.where(
        organization_id: self.organization_id,
        product_id: self.product_id,
        warehouse_id: self.warehouse_id
    ).exists?

    has_previous_movements ? :adjustment : :initial
  end


  def create_stock_movement(qty_change, movement_type)
    StockMovement.create!(
      product: self.product,
      warehouse: self.warehouse,
      quantity_change: qty_change,
      movement_date: Time.current,
      organization: self.organization,
      user: Current.user,
      movement_type: movement_type
    )
  end
end
