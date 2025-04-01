class CreateOrderItems < ActiveRecord::Migration[8.0]
  def change
    create_table :order_items do |t|
      t.integer :quantity, null: false
      t.decimal :price, precision: 10, scale: 2
      t.decimal :total_amount, precision: 12, scale: 2
      t.references :orders, null: false, foreign_key: true
      t.references :products, null: false, foreign_key: true

      t.timestamps
    end
  end
end
