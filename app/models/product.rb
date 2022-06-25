class Product < ApplicationRecord
  belongs_to :category
  has_many :cart_items
  has_many :product_availabilities
  has_many :storages, through: :product_availabilities
end
