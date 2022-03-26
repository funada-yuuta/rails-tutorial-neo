User.create!(
  name: "Example User",
  email: "example@railstutorial.org",
  password: "foobar",
  password_confirmation: "foobar",
  admin: true,
  confirmation_token: "confirmation_token",
  confirmed_at: Time.zone.now,
  confirmation_sent_at: Time.zone.now
)

99.times do |n|
name  = Faker::Name.name
email = "example-#{n+1}@railstutorial.org"
password = "password"
confirmation_token ="confirmation_token-#{n+1}"
confirmed_at = Time.zone.now
confirmation_sent_at = Time.zone.now
User.create!(
  name: name,
  email: email,
  password: password,
  password_confirmation: password,
  confirmation_token: confirmation_token,
  confirmed_at: confirmed_at,
  confirmation_sent_at: confirmation_sent_at
)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content) }
end