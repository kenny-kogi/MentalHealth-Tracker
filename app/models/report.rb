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

    def self.getAverageOfUsers
        users = User.average("age").round
    end

    def self.getAverageAgeOfPatients
        patients = Patient.average("age").round
    end

    def self.getUsersLocationData
        users = User.all
        location_data = {}

        users.map{|data| 
            if location_data.key?(data.location)
                location_data[data.location] += 1
            else
                location_data[data.location] = 1
            end
        }
        location_data
    end
end