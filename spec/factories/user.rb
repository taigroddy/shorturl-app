FactoryBot.define do
  factory :user, class: User do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    api_key { Utils::ApiKeyGenerator.encode(email: email) }
  end
end
