FactoryBot.define do
  factory :memory do
    title               {"あいうエオabc123"}
    destination         {"あいうエオabc123"}
    departure_day       {12}
    return_day          {13}
    transportation_id   {2}
    trans_memo          {"あいうエオabc123"}
    hotel               {"あいうエオabc123"}
    hotel_memo          {"あいうエオabc123"}
    best                {"あいうエオabc123"}
    happening           {"あいうエオabc123"}
    again               {"あいうエオabc123"}
    association :plan
    association :user
    association :group
  end
end
