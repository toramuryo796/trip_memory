FactoryBot.define do
  factory :plan do
    title               {"アイウエオかきくけこsashisusesoNANINUNENO123"}     
    destination         {"行先abc123"}
    departure_day       { 12 }
    return_day          { 15 }
    hotel               {"ホテル"}
    hotel_memo          {"ホテルhotel123"}
    transportation_id   {2}
    start_place         {"関空"}
    ticket              {"飛行機情報1223"}
    association :user               
    association :group           
    association :candidate       
  end
end
