class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  belongs_to :day_how

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :hour
  belongs_to_active_hash :minute

  validates :category_id, :hour_id, :minute_id, presence: true

end
