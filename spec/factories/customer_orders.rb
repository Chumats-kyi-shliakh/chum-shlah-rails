FactoryBot.define do
  factory :customer_order do
    customer
    route { "" }
    status { 1 }
  end
end
