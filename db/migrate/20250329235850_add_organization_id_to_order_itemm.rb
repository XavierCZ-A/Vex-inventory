class AddOrganizationIdToOrderItemm < ActiveRecord::Migration[8.0]
  def change
    add_reference :order_items, :organization, null: false, foreign_key: true
  end
end
