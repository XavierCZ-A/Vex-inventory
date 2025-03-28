class CreateSuppliers < ActiveRecord::Migration[8.0]
  def change
    create_table :suppliers do |t|
      t.string :company_name, null: false
      t.string :supplier_name, null: false
      t.string :supplier_phone, null: false
      t.string :supplier_email, null: false
      t.string :supplier_address
      t.text :notes

      t.timestamps
    end
  end
end
