FactoryBot.define do
  factory :day_how do
    passed          { 1 }
    association :plan
    association :user
  end
end
