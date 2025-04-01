class CreatePaymentTerms < ActiveRecord::Migration[8.0]
  def change
    create_table :payment_terms do |t|
      t.string :name, null: false
      t.integer :days, null: false
      t.text :description, null: false
      t.boolean :active, null: false

      t.timestamps
    end
  end
end
