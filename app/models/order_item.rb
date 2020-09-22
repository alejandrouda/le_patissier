class OrderItem < ApplicationRecord
  belongs_to :products
  belongs_to :carts
  validates :quantity, presence: true
end
