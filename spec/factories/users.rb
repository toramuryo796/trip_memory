FactoryBot.define do
  factory :user do
    user_ID               {"abcd123"}
    email                  {"abcd@gmail.com"}
    password               {"asdfg12345"}
    password_confirmation  {password}
  end
end
