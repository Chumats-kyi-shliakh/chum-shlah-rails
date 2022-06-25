class Customer < ApplicationRecord
  has_many :customer_orders
  has_one :cart
end
