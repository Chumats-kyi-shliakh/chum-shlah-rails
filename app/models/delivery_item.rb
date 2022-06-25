class DeliveryItem < ApplicationRecord
  belongs_to :delivery
  belongs_to :cart_item
  belongs_to :product_availability

  enum status: {
    active: 1,
    completed: 5,
  }
end
