class User < ApplicationRecord #621 methods now with AR
 #439 instance methods w AR
 has_many :plants, dependent: :destroy
 validates :username, presence: true
 validates :email, presence: true, uniqueness: true
end

