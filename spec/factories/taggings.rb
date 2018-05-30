FactoryBot.define do
  factory :tagging do
    association :post, factory: :post
    association :tag, factory: :tag
  end
end