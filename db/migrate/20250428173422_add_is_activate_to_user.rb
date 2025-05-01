class AddIsActivateToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :is_activate, :boolean
  end
end
