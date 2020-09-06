class Memory < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :transportation
end
