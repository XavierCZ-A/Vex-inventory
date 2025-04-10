class AddSkUtoProduct < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :sku, :string

    add_index :products, [ :organization_id, :sku ], unique: true
  end
end
