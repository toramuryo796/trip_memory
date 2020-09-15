class Want < ApplicationRecord
  belongs_to :plan
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :priority

  with_options presence: true do
    validates: priority_id
    validates: program, format:{with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角文字を入力してください"}
  end
end
