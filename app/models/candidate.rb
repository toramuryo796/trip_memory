class Candidate < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_one :plan

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :transportation  
  belongs_to_active_hash :budget  
end
