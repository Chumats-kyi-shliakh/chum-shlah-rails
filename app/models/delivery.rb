class Delivery < ApplicationRecord
  belongs_to :driver
  has_many :delivery_items

  enum status: {
    inactive: 0,
    active: 1,
    completed: 5,
  }
end
