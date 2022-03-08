class Feedback < ApplicationRecord
    belongs_to :patient
    belongs_to :therapist

    validates :title, presence: true 
    validates :body, presence: true 
end
