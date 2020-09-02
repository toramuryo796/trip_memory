class Schedule < ApplicationRecord
  belongs_to :user
  belongsto  :plan

  extend ActiveHash::Assosiations::ActiveRecordExtensions
  belongs_to_active_hash :category
end
