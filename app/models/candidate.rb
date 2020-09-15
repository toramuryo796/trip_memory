class Candidate < ApplicationRecord
  belongs_to       :user
  belongs_to       :group
  has_one          :plan,           dependent: :destroy
  has_one_attached :image,          dependent: :destroy
  has_many         :goods,          dependent: :destroy
  has_many         :favorites,      dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :transportation  
  belongs_to_active_hash :budget  

  def favorite_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  num = /\A[0-9]+\z/
  with_options presence: true do
    validates :budget_id
    validates :night
    validates :destination, format:{with: /\A[a-zA-Zぁ-んァ-ン一-龥]+\z/, message: "数字・記号は入力できません"}
  end
  validates :reason, length:{ maximum: 400, message: "は400字以内で記入してください"}
  validates :take_time, format: {with: num , message: "は半角数字で入力してください"}
  validates :trans_cost, format: {with: num , message: "は半角数字で入力してください"}
end
