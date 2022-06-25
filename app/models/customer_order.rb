class CustomerOrder < ApplicationRecord
  belongs_to :customer
  belongs_to :cart
  has_many :delivery_items

  enum status: {
    composed: 0,
    active: 1,
    completed: 5,
  }
end
