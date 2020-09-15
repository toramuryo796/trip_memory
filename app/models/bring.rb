class Bring < ApplicationRecord
  belongs_to :group
  belongs_to :plan
  belongs_to :user
  has_one    :check , dependent: :destroy

  with_options presence: true do
    validates :thing, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角文字で記入してください"}
  end
end
