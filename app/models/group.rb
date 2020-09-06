class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups, dependent: :destroy
  has_many :candidates
  has_many :plans
  has_many :dictionaries
  has_many :goods
  validates :name, presence: true
end
