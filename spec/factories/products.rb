FactoryBot.define do
  factory :product do
    category
    name { "MyString" }
    weight { 1 }
    height { 1 }
    width { 1 }
    length { 1 }
  end
end
