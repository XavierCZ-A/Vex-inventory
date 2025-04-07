class RemoveSenderFromInvitation < ActiveRecord::Migration[8.0]
  def change
    remove_column :invitations, :sender_id, :integer
  end
end
