class Report < ApplicationRecord

    def self.getModelsCount
        users = User.count
        patients = Patient.count
        therapists = Therapist.count

        return {
            usersCount: users,
            patientsCount: patients,
            therapistsCount: therapists
        }

    end

    def self.getModelNames
        users = User.select("firstName", "lastName", "id")
        patients = Patient.select("firstName", "lastName", "id")
        therapists = Therapist.select("firstName", "lastName", "id")

        return {
            usersDetails: users,
            patientsDetails: patients,
            therapistsDetails: therapists
        }
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

    def self.getAverageOfUsersAndPatients
        users = User.average("age").round
        patients = Patient.average("age").round

        return {
            avgAgeUsers: users,
            avgAgePatients: patients
        }
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

    def self.getPatientsLocationData
        patients = Patient.all
        location_data = {}

        patients.map{|data|
            if location_data.key?(data.location)
                location_data[data.location] += 1
            else
                location_data[data.location] = 1
            end
        }

        location_data
    end 

    def self.getUsersAffectedGenderData
        users = User.all
        gender_data = {}

        users.map{|data|
            if gender_data.key?(data.gender)
                gender_data[data.gender] += 1
            else
                gender_data[data.gender] = 1
            end
        }

        gender_data
    end

    def self.getPatientAffectedGenderData
        patients = Patient.all
        gender_data = {}

        patients.map{|data|
            if gender_data.key?(data.gender)
                gender_data[data.gender] += 1
            else
                gender_data[data.gender] = 1
            end
        }

        gender_data
    end

    def self.get_all_moods
        moods = Mood.all.count
    end

    def self.getMentalHealthFacilityData
        patients = Patient.all
        mental_facility_data = {}

         patients.map{|data|
            if mental_facility_data.key?(data.mental_health_facility)
                mental_facility_data[data.mental_health_facility] += 1
            else
                mental_facility_data[data.mental_health_facility] = 1
            end
        }

        mental_facility_data
    end
end