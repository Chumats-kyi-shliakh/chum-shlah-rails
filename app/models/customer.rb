class Customer < ApplicationRecord
  has_many :customer_orders
  has_many :carts
end
