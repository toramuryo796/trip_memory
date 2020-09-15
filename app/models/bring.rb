class Bring < ApplicationRecord
  belongs_to :group
  belongs_to :plan
  belongs_to :user
  has_one    :check , dependent: :destroy

  with_options presence: true do
    validates :thing, format: {with: /\A[0-9ぁ-んァ-ン一-龥]+\z/, message: "は全角文字で記入してください"}, length: {maximum: 40, message: "は40字以内で記入してください"}
  end
end
