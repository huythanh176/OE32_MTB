FactoryBot.define do
  factory :user do
    name {"my first user"}
    sequence(:email) { |n| "mike#{n}@awesome.com"}
    password {"password123"}
  end
end

