class AddMovementTypeToStockMovement < ActiveRecord::Migration[8.0]
  def change
    add_column :stock_movements, :movement_type, :integer
  end
end
