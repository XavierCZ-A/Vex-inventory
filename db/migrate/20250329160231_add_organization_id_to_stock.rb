class AddOrganizationIdToStock < ActiveRecord::Migration[8.0]
  def change
    add_reference :stocks, :organization, null: false, foreign_key: true
  end
end
