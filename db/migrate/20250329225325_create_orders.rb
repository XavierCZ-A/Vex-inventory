class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.date :order_date, null: false
      t.string :order_number, null: false
      t.text :notes
      t.integer :status, default: 0
      t.references :payment_terms, null: false, foreign_key: true
      t.references :suppliers, null: false, foreign_key: true

      t.timestamps
    end
  end
end
