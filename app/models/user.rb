class User < ApplicationRecord
    followability
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  self.table_name = "users"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, presence: true, length: { minimum:10}
  validates :name, presence: true, length: {minimum:5}
  has_many :user_votes
  has_many :voted_parties, through: :user_votes, source: :party
  has_many :reports

end
