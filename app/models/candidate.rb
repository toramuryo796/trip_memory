class Candidate < ApplicationRecord
  belongs_to       :user
  belongs_to       :group
  has_one          :plan,           dependent: :destroy
  has_one_attached :image,          dependent: :destroy
  has_many         :favorites,      dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :transportation  
  belongs_to_active_hash :budget  

  def favorite_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  integer = { only_integer: true, message: "は半角数字で入力してください"}

  validates :reason, length:{ maximum: 400, message: "は400字以内で記入してください"}
  validates :take_time,numericality: integer
  validates :trans_cost, numericality: integer

  with_options presence: true do
    validates :budget_id
    validates :night
    validates :destination, length:{ maximum: 40, message: "は40字以内で記入してください"}
  end
end
