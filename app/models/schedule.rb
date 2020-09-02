class Schedule < ApplicationRecord
  belongs_to :user
  belongsto  :plan
  belongs_to :day_how

  extend ActiveHash::Assosiations::ActiveRecordExtensions
  belongs_to_active_hash :category
end
