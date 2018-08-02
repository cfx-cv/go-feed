class AddOrderReferenceToOrderMenus < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_menus, :order, foreign_key: true
  end
end
