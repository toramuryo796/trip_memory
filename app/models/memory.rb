class Memory < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  belongs_to :group
  has_many_attached :images
  has_many   :diaries, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :transportation

  length = { maximum: 400, message: "は400字以内で記入してください" } 
  houndred = { maximum: 100, message: "は400字以内で記入してください" } 

  with_options presence:true do
    validates :title
    validates :destination
    validates :departure_day
    validates :return_day
    validates :transportation_id
    validates :trans_memo, length: length
    validates :hotel
    validates :hotel_memo, length: length
    validates :best, length: houndred
    validates :happening, length: houndred
    validates :again, length: houndred
  end
end
