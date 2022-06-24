FactoryBot.define do
  factory :delivery_item do
    outdated { false }
    status { 1 }
    quantity { 1 }
    delivery { nil }
    cart_item { nil }
    product_availability { nil }
  end
end
