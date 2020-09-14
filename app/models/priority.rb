class Priority < ActiveHash::Base
  self.data = [
    {id: 1, name: "高"},
    {id: 2, name: "中"},
    {id: 3, name: "低"}
  ]
end
