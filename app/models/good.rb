class Good < ApplicationRecord
  belongs_to :candidate
  belongs_to :user
  validates_uniqueness_of :candidate_id, scope: :user_id
end
