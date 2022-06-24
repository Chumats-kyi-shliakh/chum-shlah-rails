FactoryBot.define do
  factory :product_availability do
    storage
    product
    quantity { 1 }
  end
end
