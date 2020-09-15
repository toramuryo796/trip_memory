class Dictionary < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  belongs_to :group

  full_charactor = {with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角文字で入力"}
  length = { maximum: 40, message: "は40字以内で記入してください"}

  with_options presence: true do
    validates :language, format: full_charactor, length: length
    validates :japanese, length: length
    validates :translation, length: length
  end
end
