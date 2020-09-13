class Bring < ApplicationRecord
  belongs_to :group
  belongs_to :plan
  belongs_to :user
  has_one    :check , dependent: :destroy
end
