FactoryBot.define do
  factory :review do
    title { "MyString" }
    content { "MyText" }
    rating { 1 }
    user { nil }
  end
end
