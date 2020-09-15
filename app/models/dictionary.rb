class Dictionary < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  belongs_to :group

  full_charactor = {with: /\A[ぁ-んァ-ン一-龥]/, message: "全角文字で入力"}
  with_options presence: true do
    validates :language, format: full_charactor
    validates :japanese, format: full_charactor
    validates :translation, format: full_charactor
  end
end
