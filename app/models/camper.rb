class Camper < ApplicationRecord
    has_many :signups
    has_many :activities, through: :signups 


    validates :name, presence: true
    validates :age, numericality: {less_than_or_equal_to: 18, greater_than: 8}

    def detail
        {
            id: self.id,
            name: self.name,
            age: self.age,
            activities: self.activities.map{|activity| {
                id: activity.id,
                name: activity.name,
                difficulty: activity.difficulty     
            }}
        }
    end
end
