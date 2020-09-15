FactoryBot.define do
  factory :diary do
    specific   {1}
    title      {"あいうエオabc123"}
    content    {"abcアイウエオかきくけこ123"}
    association :memory
    association :user
  end
end
