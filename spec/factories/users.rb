FactoryBot.define do
  factory :user do
    name { "Test" }
    email { "test@example.com" }
    password { "testpass" }
    confirmation_token { "confirmation_token" }
    confirmed_at { Time.zone.now }
    confirmation_sent_at { Time.zone.now }

    trait :admin do
      email { "test-admin@example.com" }
      admin { true }
      confirmation_token { "confirmation_token-admin" }
    end
  end
end
