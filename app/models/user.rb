class User < ApplicationRecord
    
    has_secure_password
    has_many :moods, dependent: :destroy
    has_one_attached :image

    validates :username, presence: true 
    validates :username, uniqueness: true
    validates :username, length: { minimum: 4 }
    validates :email, presence: true
    validates :email, uniqueness: true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    # validates :firstName, presence: true
    # validates :lastName, presence: true 

    def self.getslepthoursdata(id)
        hours_slept_array = []
        sleepinghoursdata = User.find_by(id: id).moods.select("hours_slept", "created_at").last(10)
        sleepinghoursdata.map{  |data| 
            hours_slept_array.push({label: data.created_at, y: data.hours_slept})
        }
        hours_slept_array
    end

    def self.getaverageslepthours(id)
        hours_slept_array = []
        sleepinghoursdata = User.find_by(id: id).moods.select("hours_slept")
        sleepinghoursdata.map{  |data| 
            hours_slept_array.push(data.hours_slept)
        }
        hours_slept_array.sum / hours_slept_array.size
    end

end
