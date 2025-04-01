class CorrectOrderItemsReferences < ActiveRecord::Migration[8.0]
  def change
    rename_column :order_items, :orders_id, :order_id
    rename_column :order_items, :products_id, :product_id
  end
end
