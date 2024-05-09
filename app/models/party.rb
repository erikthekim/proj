class Party < ApplicationRecord
    # Validations
    validates :host, presence: true
    validates :time, presence: true
    has_many :user_votes
    has_many :voters, through: :user_votes, source: :user
    
  end
  