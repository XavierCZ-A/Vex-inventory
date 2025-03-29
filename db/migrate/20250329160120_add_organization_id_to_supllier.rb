class AddOrganizationIdToSupllier < ActiveRecord::Migration[8.0]
  def change
    add_reference :suppliers, :organization, null: false, foreign_key: true
  end
end
