FactoryBot.define do
  factory :candidate do
    budget_id           { 1 }
    night               { "2泊3日" }
    destination         { "アメリカUSA" }
    reason              { "アイウエオかきくけこSASHISUSESOnaninuneno123" }
    transportation_id   { 3 }
    take_time           { 6 }
    trans_cost          { 1000000 }
    association         :user
    association         :group
  end
end
