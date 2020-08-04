FactoryBot.define do
  factory :comment do
    content { "My important comment." }
    association :post
    user { post.user }
  end
end
