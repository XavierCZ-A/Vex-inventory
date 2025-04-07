class CreateInvitations < ActiveRecord::Migration[8.0]
  def change
    create_table :invitations do |t|
      t.string :email, null: false
      t.string :token, null: false
      t.integer :sender_id
      t.integer :recipient_id
      t.references :organization, null: false, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
    add_index :invitations, :email
    add_index :invitations, :token, unique: true
  end
end
