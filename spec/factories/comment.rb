FactoryBot.define do
  factory :comment do
    content { "my content" }
    movie_id {1}
    user_id {1}
  end
end
