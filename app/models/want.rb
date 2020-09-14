class Want < ApplicationRecord
  belongs_to :plan
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :priority
end
