class AddCapacityToWarehouse < ActiveRecord::Migration[8.0]
  def change
    add_column :warehouses, :capacity, :integer
  end
end
