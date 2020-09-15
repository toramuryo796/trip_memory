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
  has_many :brings
  has_many :checks
  has_many :diaries
  
  with_options presence: true do
    validates :user_ID, format: {with: /\A[a-zA-Z0-9]+\z/, message: "は半角英数字で入力してください"}, length: {maximum: 40, message: "は40文字以内で入力してください"}
    validates :password, format: {with: /(?=.*\d+.*)(?=.*[a-zA-Z]+.*)+/, message: "は半角英数字を混合させて入力してください"}
    validates :email,    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "は@を入れて半角で入力してください"}
  end
end
