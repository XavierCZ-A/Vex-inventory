class CreateWarehouses < ActiveRecord::Migration[8.0]
  def change
    create_table :warehouses do |t|
      t.string :name, null: false
      t.text :address, null: false

      t.timestamps
    end
  end
end
