class UserVote < ApplicationRecord
  belongs_to :user
  belongs_to :party

  # Ensuring a user can only upvote or downvote once per party
  validates :user_id, uniqueness: { scope: [:party_id, :vote_type] }
end
