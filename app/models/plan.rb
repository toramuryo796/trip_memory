class Plan < ApplicationRecord
  belongs_to        :user 
  belongs_to        :group
  belongs_to        :candidate,      optional: true
  has_many          :schedules,      dependent: :destroy
  has_many          :day_hows,       dependent: :destroy
  has_one_attached  :image,          dependent: :destroy
  has_many          :dictionaries,   dependent: :destroy
  has_many          :brings,         dependent: :destroy
  has_many          :wants,           dependent: :destroy
  has_one           :memory,         dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :transportation  

  string_length = { maximum: 40, message: "は40字以内で記入してください"}
  text_length = { maximum: 400, message: "は400字以内で記入してください"}

  with_options presence: true do
    validates :title, length: string_length
    validates :destination, length: string_length
  end
  
  validates :hotel, length: string_length
  validates :hotel_memo, length: text_length
  validates :ticket, length: text_length
  validates :start_place, length: string_length
end
