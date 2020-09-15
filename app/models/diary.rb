class Diary < ApplicationRecord
  belongs_to :user
  belongs_to :memory

  with_options presence: true do
    validates :specific,numericality: Integer
    validates :title, length:{ maximum: 40, message: "は40字以内で記入してください"}
    validates :content, length:{ maximum: 1000, message: "は1000字以内で記入してください"}
  end
end
