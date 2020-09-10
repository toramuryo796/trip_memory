class Candidate < ApplicationRecord
  belongs_to       :user
  belongs_to       :group
  has_one          :plan,    dependent: :destroy
  has_one_attached :image,   dependent: :destroy
  has_many         :goods,   dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :transportation  
  belongs_to_active_hash :budget  

  validates :transportation_id, :budget_id, presence: true
end
