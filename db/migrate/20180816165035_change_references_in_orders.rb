class ChangeReferencesInOrders < ActiveRecord::Migration[5.2]
  def change
    remove_reference :orders, :customer
    add_reference :orders, :customer, foreign_key: { to_table: :users }

    remove_reference :orders, :driver
    add_reference :orders, :driver, foreign_key: { to_table: :users }
  end
end
