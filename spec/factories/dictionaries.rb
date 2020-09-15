FactoryBot.define do
  factory :dictionary do
    language    { "英語" }
    japanese    { "MyString123" }
    translation { "MyString123" }
    association :plan
    association :user
    association :group
  end
end
