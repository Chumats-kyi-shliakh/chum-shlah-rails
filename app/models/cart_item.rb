class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  has_many :delivery_items
end
