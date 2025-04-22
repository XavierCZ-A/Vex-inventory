class CreateStockMovements < ActiveRecord::Migration[8.0]
  def change
    create_table :stock_movements do |t|
      t.references :product, null: false, foreign_key: true
      t.references :warehouse, null: true, foreign_key: true
      t.integer :quantity_change, null: false
      t.datetime :movement_date, null: false
      t.text :notes, null: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :stock_movements, :movement_date
  end
end
