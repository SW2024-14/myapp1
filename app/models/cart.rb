# app/models/cart.rb
class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :restaurants, through: :cart_items
end

# app/models/cart_item.rb
class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :restaurant
end

# app/models/restaurant.rb
class Restaurant < ApplicationRecord
  has_many :cart_items
  has_many :carts, through: :cart_items
end