class CartItem < ApplicationRecord
  belongs_to :products
  belongs_to :carts
end
