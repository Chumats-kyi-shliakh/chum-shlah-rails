class ProductAvailability < ApplicationRecord
  belongs_to :storage
  belongs_to :product
  has_one :delivery_item
end
