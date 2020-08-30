class Transportation < ActiveHash::Base
  self.data = [
    {id: 1, name: "自動車"},
    {id: 2, name: "バス"},
    {id: 3, name: "電車"},
    {id: 4, name: "新幹線"},
    {id: 5, name: "飛行機"},
    {id: 6, name: "船"},
    {id: 7, name: "徒歩/自転車"}
  ]
end
