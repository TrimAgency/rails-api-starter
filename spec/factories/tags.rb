FactoryBot.define do
  factory :tag do
    name { Faker::Lorem.word }

    after(:create) do |tag|
      tag.posts << create(:post)
    end
  end
end