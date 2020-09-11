class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_groups
  has_many :groups,      through: :user_groups, dependent: :destroy
  has_many :candidates
  has_many :plans
  has_many :favorites
  has_many :favorite_candidates, through: :favorites, source: :candidate
  has_many :schedules 
  has_many :day_hows 
  has_many :dictionaries
  has_many :memories
  # has_many :memories
  
  all_characters = /\A[0-9a-zA-Zぁ-んァ-ンー-龥]+\Z/
  with_options presence: true do
    validates :user_ID, format: {with: all_characters}, length: {maximum: 40, message: "is invalid. Input within 40 characters"}
  end
  validates :password, format: {with: /(?=.*\d+.*)(?=.*[a-zA-Z]+.*)+/, message: "is invalid.Input half_width characters and number."}
  validates :email,    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "is invalid. Include half_characters with '@'"}
end
