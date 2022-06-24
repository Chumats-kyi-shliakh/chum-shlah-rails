class DeliveryItem < ApplicationRecord
  belongs_to :delivery
  belongs_to :cart_item
  belongs_to :product_availability
end
