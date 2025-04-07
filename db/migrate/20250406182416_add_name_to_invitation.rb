class AddNameToInvitation < ActiveRecord::Migration[8.0]
  def change
    add_column :invitations, :name, :string, null: false
  end
end
