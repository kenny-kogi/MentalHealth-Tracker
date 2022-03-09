class Feedback < ApplicationRecord
    belongs_to :patient
    belongs_to :therapist

    validates :title, presence: true 
    validates :body, presence: true 

    def created_at
        attributes['created_at'].strftime("%a %I:%M%p")
    end

    def self.get_therapist_feedback(id)
        feedback = Feedback.where(patient_id: id)    
    end

    # def self.patient
    #     puts "tr"
    #     patient.therapist
    # end
end
