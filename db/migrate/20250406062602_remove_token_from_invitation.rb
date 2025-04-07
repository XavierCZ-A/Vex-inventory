class RemoveTokenFromInvitation < ActiveRecord::Migration[8.0]
  def change
    remove_column :invitations, :token, :string
  end
end
