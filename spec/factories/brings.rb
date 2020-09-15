FactoryBot.define do
  factory :bring do
    thing  {"あいうえお"}
    association :group
    association :plan
    association :user
  end
end
