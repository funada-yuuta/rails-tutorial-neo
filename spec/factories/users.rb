FactoryBot.define do
  factory :user do
    trait :admin do
      name { "Test" }
      email { "test@example.com" }
      password { "testpass" }
      admin { true }
      confirmation_token { "confirmation_token" }
      confirmed_at { Time.zone.now }
      confirmation_sent_at { Time.zone.now }
    end

    trait :normal do
      name { "Test2" }
      email { "test-2@example.com" }
      password { "testpass" }
      confirmation_token { "confirmation_token-2" }
      confirmed_at { Time.zone.now }
      confirmation_sent_at { Time.zone.now }
    end
  end
end
