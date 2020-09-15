FactoryBot.define do
  factory :want do
    priority_id   {1}
    program       {"アイウエオあいうえおabc1123"}
    association :plan
  end
end
