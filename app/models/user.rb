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
        hours_slept_created_date = []
        sleepinghoursdata = User.find_by(id: id).moods.select("hours_slept", "created_at")
        sleepinghoursdata.map{  |data|  hours_slept_array.push(data.hours_slept)
                                        hours_slept_created_date.push(data.created_at)
        }
                     
        {  hours_slept:  hours_slept_array.to_a,
           date_created: hours_slept_created_date.to_a
        }
    end

end
