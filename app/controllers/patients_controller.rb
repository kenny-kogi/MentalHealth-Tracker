class PatientsController < ApplicationController
    def index
        @patients = Patient.all
        if @patients
            render json: {
                patients: @patients
            }
        else
            render json: {
                status: 404,
                errors: ['No user found']
            }
        end
    end

    def show
        @patient = Patient.find(params[:id])

        if @patient 
            render json: {
                patient: @patient
            }
        else
            render json: {
                status: 404,
                errors: ['User not found']
            }
        end
    end

    def create
        @patient = Patient.new(patient_params)

        if @patient.save
            session[:patient_id] = @patient.id
            render json: {
                status: :created,
                patient: @patient
            }
        else
            render json: {
                status: 500,
                errors: @patient.errors.full_messages
            }
        end
    end

    private

    def patient_params 
        params.require(:patient).permit(:firstName, :lastName, :username, :email, :password, :password_confirmation, :location, :age, :occupation, :gender, :image_url, :mental_health_status, :mental_health_facility, :therapist_id)
    end

end


