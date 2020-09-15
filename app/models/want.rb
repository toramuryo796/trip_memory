class Want < ApplicationRecord
  belongs_to :plan
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :priority

  with_options presence: true do
    validates :priority_id
    validates :program, length: {maximum: 40, message: "は40字以内で記入してください"}
  end
end
