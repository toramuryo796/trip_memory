class DayHow < ApplicationRecord
  belongs_to :plan
  has_many   :schedules
  belongs_to :user
end