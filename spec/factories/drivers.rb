FactoryBot.define do
  factory :driver do
    login { "MyString" }
    encrypted_password { "MyString" }
    online { false }
    last_online { "2022-06-24 16:37:29" }
  end
end
