class DayHow < ApplicationRecord
  belongs_to :plan
  has_many   :schedules, dependent: :destroy
  belongs_to :user
  
  with_options presence: true do
    validates :passed, numericality:{ only_integer: true, message: "は半角数字で入力してください"}, format: { with: /\A[0-9]+\Z/, message: 'は半角数字を入力してください' }
  end
end