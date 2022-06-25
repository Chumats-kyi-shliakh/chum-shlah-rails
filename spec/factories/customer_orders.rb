FactoryBot.define do
  factory :customer_order do
    customer
    cart
    country { "MyString" }
    city { "MyString" }
    postal_code { "MyString" }
    street { "MyString" }
    house_number { "MyString" }
    route { "" }
    status { 1 }
  end
end
