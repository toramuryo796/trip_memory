class Dictionary < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  belongs_to :group
end
