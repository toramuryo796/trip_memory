class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  belongs_to :day_how

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :hour
  belongs_to_active_hash :minute

  with_options presence: true do
    validates :program, length:{ maximum: 100, message: "は100字以内で記入してください"}
  end

end
