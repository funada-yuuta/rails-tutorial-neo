FactoryBot.define do
  factory :user do
    name { "Test" }
    email { "test@example.com" }
    password { "testpass" }
  end
end
