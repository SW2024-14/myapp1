class AddDescriptionToRestaurants < ActiveRecord::Migration[7.1]
  def change
    add_column :restaurants, :description, :text
    add_column :restaurants, :price, :integer
  end
end
