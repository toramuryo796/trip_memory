class DayHow < ApplicationRecord
  belongs_to :plan
  has_many   :schedules, dependent: :destroy
  belongs_to :user
  
  with_options presence: true do
    validates :passed, format:{ with: /\A[0-9]+\z/, message: "は半角数字で入力してください"}
  end
end