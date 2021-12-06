FactoryBot.define do
  factory :order do
    serial { "MyString" }
    user { nil }
    course { nil }
    amount { 1 }
    recipient { "MyString" }
    address { "MyString" }
    state { "MyString" }
  end
end
