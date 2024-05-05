class User < ApplicationRecord
    followability
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    validates :encrypted_password, presence: true, length: { minimum:10}
    validates :name, presence: true, length: {minimum:5}

end
