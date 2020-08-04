FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "Test post #{n}" }
    content { "A test post." }
    association :user

    trait :with_comments do
      after(:create) { |post| create_list(:comment, 5, post: post) }
    end
  end
end
