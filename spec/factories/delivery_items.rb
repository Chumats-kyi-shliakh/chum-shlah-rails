FactoryBot.define do
  factory :delivery_item do
    outdated { false }
    status { 1 }
    quantity { 1 }
    delivery
    cart_item
    product_availability
  end
end
