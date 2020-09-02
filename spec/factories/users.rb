FactoryBot.define do
  factory :user do
    user_ID               {"aiueoかきくけこサシスセソ12345asdfghjklzxcvbnmqwe"}
    email                  {"abcd@gmail.com"}
    password               {"asdfg12345"}
    password_confirmation  {password}
  end
end
