class User < ApplicationRecord #621 methods now with AR
 #439 instance methods w AR

    #associations
    has_many :plants, dependent: :destroy #-> https://apidock.com/rails/v5.2.3/ActiveRecord/Associations/ClassMethods/has_many
  
    # password security
    has_secure_password #password, password=, authenticate

    # validations
    validates :username, presence: true, length: {in: 4..25}
    validates :email, presence: true, uniqueness: true, format: {with: /\A(?<username>[^@\s]+)@((?<domain_name>[-a-z0-9]+)\.(?<domain>[a-z]{2,}))\z/i}
    validates :age, numericality: {only_integer: true, greater_than: 15}
    validates :password, length: {in: 6..25}

    # setup user roles
    enum role: %i(client admin superadmin) 
    # scope :most_plants, -> {joins(:plants).group(:user_id).order("COUNT(plants.id) DESC").limit(1)}

    def self.most_plants
        User.preload(:plants).all.max_by {|user| user.plants.length}
        # User.joins(:plants).group(:user_id).order("COUNT(plants.id) DESC").limit(1)

        # max_count = 0
        # final_user = nil
        # User.all.each do |user|
        #     if user.plants.length > max_count
        #         max_count = user.plants.length
        #         final_user = user
        #     end
        # end
        # return final_user
    end
end

