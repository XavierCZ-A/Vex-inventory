class RenamePaymentTermsAndSuppliersIdsInOrders < ActiveRecord::Migration[8.0]
  def change
    rename_column :orders, :payment_terms_id, :payment_term_id
    rename_column :orders, :suppliers_id, :supplier_id
  end
end
