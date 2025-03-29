class RemoveFieldsToOrganization < ActiveRecord::Migration[8.0]
  def change
    remove_column :organizations, :email, :string
    remove_column :organizations, :password, :string
  end
end
