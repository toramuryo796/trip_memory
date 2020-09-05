class DayHow < ApplicationRecord
  belongs_to :plan
  has_many   :schedules, dependent: :destroy
  belongs_to :user
end