class AddOrganizationIdToStockMovements < ActiveRecord::Migration[8.0]
  def change
    add_reference :stock_movements, :organization, null: false, foreign_key: true
  end
end
