FactoryBot.define do
  factory :customer_order do
    customer { nil }
    route { "" }
    status { 1 }
  end
end
