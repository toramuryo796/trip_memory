class Plan < ApplicationRecord
  belongs_to :users
  belongs_to :groups
  belongs_to :candidates
  # has_one :Bring
  # has_one :purpose
  # has_one :Schedule
  # has_one :memory
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :transportation  
end
