# app/models/user_vote.rb
class UserVote < ApplicationRecord
  belongs_to :user
  belongs_to :party

  # Ensures a user can only vote once per party
  validates :user_id, uniqueness: { scope: :party_id }
end
