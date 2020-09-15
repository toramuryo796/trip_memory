FactoryBot.define do
  factory :schedule do
    hour_id         { 8 }
    minute_id       { 5 }
    program         { "aiueoかきくけこサシスセソ123" } 
    category_id     { 2 } 
    association :plan
    association :user
    association :day_how
  end         
end
