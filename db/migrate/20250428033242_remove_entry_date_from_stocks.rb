class RemoveEntryDateFromStocks < ActiveRecord::Migration[8.0]
  def change
    remove_column :stocks, :entry_date
  end
end
