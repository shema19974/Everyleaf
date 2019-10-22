FactoryBot.define do
  factory :user do
    name { "Shema" }
    email { "shema@gmail.com" }
    password { "prince123" }
  end
  factory :user1 do
    name { "Prince" }
    email { "prince@gmail.com" }
    password { "prince123" }
  end
end
