class Report < ApplicationRecord

    def self.getUsersCount
        users = User.count
    end

    def self.getUserNames
        users = User.select("firstName", "lastName", "id")
    end

    def self.getPatientsCount
        patients = Patient.count
    end

    def self.getPatientNames
        patients = Patient.select("firstName", "lastName", "id")
    end

    def self.getTherapistCount
        therapists = Therapist.count
    end

    def self.getTherapistNames
        therapists = Therapist.select("firstName", "lastName", "id")
    end

    def self.getTherapistPatients
        therapist = Patient.all
        therapist_patient = {}
        therapist.map{|data|       
            if therapist_patient.key?(data.therapist.firstName) 
                therapist_patient[data.therapist.firstName].push(data.firstName)   
            else
                therapist_patient[data.therapist.firstName] = [data.firstName]
            end
        }
        therapist_patient
    end
end