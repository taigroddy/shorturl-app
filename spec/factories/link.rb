FactoryBot.define do
  factory :link, class: Link do
    name { Faker::Name.unique.name }
    original_url { Faker::Internet.url }
    short_path do
      Utils::Base62Encoder.from_base10(Faker::IDNumber.croatian_id, NUM_OF_SHORT_URL_CHAR)
    end
    user { FactoryBot.create(:user) }
  end
end
