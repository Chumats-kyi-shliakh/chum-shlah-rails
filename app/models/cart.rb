class Cart < ApplicationRecord
  belongs_to :customer, optional: true
  has_many :cart_items
  has_one :customer_order
end
