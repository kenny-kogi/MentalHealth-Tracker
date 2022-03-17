class ReportsController < ApplicationController

    def get_users_count
        @data = Report::getUsersCount

        if @data
            render json: {
                status: 200,
                usersCount: @data
            }
        else
            render json: {
                status: 500,
                errors: @data.errors.full_messages
            }
        end
    end

    def get_users_names
        @data = Report::getUserNames

        if @data
            render json: {
                status: 200,
                usersNames: @data
            }
        else
            render json: {
                status: 500,
                errors: @data.errors.full_messages
            }
        end
    end

    def get_patients_count
        @data = Report::getPatientsCount

        if @data
            render json: {
                status: 200,
                patientCount: @data
            }
        else
            render json:{
                status: 500,
                errors: @data.errors.full_messages
            }
        end
    end

    def get_patients_names
        @data = Report::getPatientNames

        if @data
            render json: {
                status: 200,
                patientNames: @data
            }
        else
            render json: {
                status: 500,
                errors: @data.errors.full_messages
            }
        end
    end

    def get_therapist_count
        @data = Report::getTherapistCount

        if @data
            render json: {
                status: 200,
                therapistCount: @data
            }
        else
            render json: {
                status: 500,
                errors: @data.errors.full_messages
            }
        end
    end

    def get_therapist_names
        @data = Report::getTherapistNames

        if @data
            render json: {
                status: 200,
                therapistNames: @data
            }
        else
            render json: {
                status: 500,
                errors: @data.errors.full_messages
            }
        end
    end

    def get_therapist_patient
        @data = Report::getTherapistPatients

        if @data
            render json: {
                status: 200,
                therapistPatients: @data
            }
        else
            render json: {
                status: 500,
                errors: @data.errors.full_messages
            }
        end
    end

    def get_average_age_users
        @data = Report::getAverageOfUsers

        if @data
            render json: {
                status: 200,
                averageAgeUsers: @data
            }
        else
            render json: {
                status: 500,
                errors: @data.errors.full_messages
            }
        end
    end

    def get_average_age_patient
        @data = Report::getAverageAgeOfPatients

        if @data
            render json: {
                status: 200,
                averageAgePatients: @data
            }
        else
            render json: {
                status: 500,
                errors: @data.errors.full_messages
            }
        end
    end

    def get_user_location_data
        @data = Report::getUsersLocationData

        if @data 
            render json: {
                status: 200,
                userLocationData: @data
            }
        else
            render json: {
                status: 500,
                errors: @data.errors.full_messages
            }
        end
    end

    def get_patient_location_data
        @data = Report::getPatientsLocationData

        if @data
            render json: {
                status: 200,
                patientLocationData: @data
            }
        else
            render json: {
                status: 500,
                errors: @data.errors.full_messages
            }
        end
    end

    def get_user_gender_data
        @data = Report::getUsersAffectedGenderData

        if @data
            render json: {
                status: 200,
                userGenderData: @data
            }
        else
            render json: {
                status: 500,
                errors: @data.errors.full_messages
            }
        end
    end

    def get_patient_gender_data
        @data = Report::getPatientAffectedGenderData

        if @data
            render json: {
                status: 200,
                patientGenderData: @data
            }
        else
            render json: {
                status: 500,
                errors: @data.errors.full_messages
            }
        end
    end
end