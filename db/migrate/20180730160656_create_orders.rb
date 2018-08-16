class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :restaurant, foreign_key: true
      t.references :customer, foreign_key: { to_table: :user }
      t.references :driver, foreign_key: { to_table: :user }

      t.timestamps
    end
  end
end
