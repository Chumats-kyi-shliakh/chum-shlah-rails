class Storage < ApplicationRecord
  belongs_to :fund
  has_many :product_availabilities
  has_many :products, through: :product_availabilities
end
