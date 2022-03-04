class Plant < ApplicationRecord
    #associations
    #the belongs_to association automatically enforces the presence of the user_id
    belongs_to :user #6 methods e.g. user, user= check them all out here -> https://apidock.com/rails/ActiveRecord/Associations/ClassMethods/belongs_to
    
    #validations
    validates :name, :species, presence: true
    validates :sun_exposure, :watering_freq, numericality: {only_integer: true}
end