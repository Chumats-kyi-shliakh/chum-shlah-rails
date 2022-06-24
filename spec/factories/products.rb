FactoryBot.define do
  factory :product do
    category { nil }
    name { "MyString" }
    weight { 1 }
    height { 1 }
    width { 1 }
    length { 1 }
  end
end
