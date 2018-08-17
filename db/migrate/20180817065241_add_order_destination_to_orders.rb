class AddOrderDestinationToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :order_destination, foreign_key: { to_table: :positions }
  end
end
