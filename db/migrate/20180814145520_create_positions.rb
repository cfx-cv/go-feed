class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
