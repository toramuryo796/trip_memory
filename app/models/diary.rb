class Diary < ApplicationRecord
  belongs_to :user
  belongs_to :memory
end
