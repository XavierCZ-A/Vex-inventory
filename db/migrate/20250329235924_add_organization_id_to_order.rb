class AddOrganizationIdToOrder < ActiveRecord::Migration[8.0]
  def change
    add_reference :orders, :organization, null: false, foreign_key: true
  end
end
