FactoryBot.define do
  factory :post do
    category 0
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
    association :user, factory: :user
  end
end
