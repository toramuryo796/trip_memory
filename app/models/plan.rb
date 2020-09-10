class Plan < ApplicationRecord
  belongs_to        :user 
  belongs_to        :group
  belongs_to        :candidate,    optional: true
  has_many          :schedules,    dependent: :destroy
  has_many          :day_hows,     dependent: :destroy
  has_one_attached  :image,        dependent: :destroy
  has_many          :dictionaries, dependent: :destroy
  has_one           :memory,       dependent: :destroy
  # has_one :Bring
  # has_one :purpose
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :transportation  
  
  validates :title, :destination, presence: true
end
