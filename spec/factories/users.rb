FactoryBot.define do
  factory :user, aliases: [:owner] do
    sequence(:email) { |n| "tester#{n}@gmail.com" }
    password { '123456' }
  end
end
