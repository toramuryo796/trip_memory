class Group < ApplicationRecord
  has_many :user_groups,         dependent: :destroy
  has_many :users,               through:   :user_groups, dependent: :destroy
  has_many :candidates,          dependent: :destroy
  has_many :plans,               dependent: :destroy
  has_many :dictionaries,        dependent: :destroy
  has_many :brings,              dependent: :destroy
  has_many :memories,            dependent: :destroy

  with_options presence: true do
    validates :name , uniqueness: true, length: {maximum: 40, message: "は40字以内で記入してください"}
  end
end
