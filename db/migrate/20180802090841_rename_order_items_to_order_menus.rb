class RenameOrderItemsToOrderMenus < ActiveRecord::Migration[5.2]
  def change
    rename_table :order_items, :order_menus
  end
end
