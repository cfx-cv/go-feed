class AddPositionReferenceToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_reference :restaurants, :position, foreign_key: true
  end
end
