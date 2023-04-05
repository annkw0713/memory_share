FactoryBot.define do
  factory :memory do
    title { Faker::Lorem.word }
    date { Faker::Date }
    person { Faker::Lorem.word }
    place { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    association :user

    after(:build) do |memory|
      memory.images.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg', content_type: 'images/jpg')
    end
  end
end
