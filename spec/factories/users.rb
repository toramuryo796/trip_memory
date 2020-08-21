FactoryBot.define do
  factory :user do
    nickname               {"aiueoかきくけこサシスセソ12345asdfghjklzxcvbnmqwe"}
    email                  {"abcd@gmail.com"}
    password               {"asdfg12345"}
    password_confirmation  {password}
  end
end
