class Therapist < ApplicationRecord
    has_secure_password
    has_many :patients, dependent: :destroy
    has_many :feedbacks, dependent: :destroy

    validates :username, presence: true 
    validates :username, uniqueness: true
    validates :username, length: { minimum: 4 }
    validates :email, presence: true
    validates :email, uniqueness: true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :firstName, presence: true
    validates :lastName, presence: true


    def self.get_all_therapist_patients(id)
        therapist = Therapist.find_by(id: id)
        therapist.patients
    end

    def self.remove_patient_from_therapist(therapist_id, patient_id)
        therapist = Therapist.find_by(id: therapist_id)
        therapist.patients.where(id: patient_id).update(therapist_id: nil)
    end
end
