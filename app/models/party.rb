class Party < ApplicationRecord
    # Validations
    validates :host, presence: true
    validates :time, presence: true
    has_many :user_votes, dependent: :destroy
    has_many :voters, through: :user_votes, source: :user, dependent: :destroy
    
  end
  