class ReportsController < ApplicationController

   def get_models_count
        @data = Report::getModelsCount

        if @data
            render json: {
                status: 200,
                modelsCount: @data
            }
        else
            render json: {
                status: 500,
                errors: @data.errors.full_messages
            }
        end
    end

    def get_model_names
        @data = Report::getModelNames

        if @data
            render json: {
                status: 200,
                modelsNames: @data
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

    def get_average_age_users_patients
        @data = Report::getAverageOfUsersAndPatients

        if @data
            render json: {
                status: 200,
                averageAges: @data
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