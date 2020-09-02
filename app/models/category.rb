class Category < ActiveHash::Base
  self.data = [
    {id: 1, name: "移動" },
    {id: 2, name: "食事" },
    {id: 3, name: "ホテル" },
    {id: 4, name: "観光" },
    {id: 5, name: "海・プール" },
    {id: 6, name: "自然" },
    {id: 7, name: "仕事" },
    {id: 8, name: "その他" }
  ]
end
