class TherapistsController < ApplicationController
    def index
        @therapists = Therapist.all

        if @therapists
            render json: {
                status: :ok,
                therapists: @therapists,
            }
        else
            render json: {
                status: 404,
                errors: ['No therapist found']
            }
        end
    end

    # def show
    #     @therapist = Therapist.find(params[:id])
    #     if @therapist
    #         render json: {
    #             therapist: @therapist
    #         }
    #     else
    #         render json: {
    #             status: 500,
    #             errors: ['Therapist not found']
    #         }
    #     end
    # end

    def create
        @therapist = Therapist.new(therapists_params)

        if @therapist.save
            render json: {
                status: :created,
                therapist: @therapist
            }
        else
            render json: {
                status: 500,
                errors: @therapist.errors.full_messages
            }
        end
    end

    def destroy
        @therapist = Therapist.find(params[:id])

        if @therapist.destroy
            render json: {
                status: :deleted
            }
        else
            render json: {
                errors: @therapist.errors.full_messages
            }
        end
    end

    def get_all_patients
        @data = Therapist.get_all_therapist_patients(params[:id])

        if @data
            render json: {
                status: 200,
                patients: @data
            }
        else
            render json: {
                status: 500,
                errors: @data.errors.full_messages
            }
        end
    end

    def remove_patient_from_therapist
        @data = Therapist.remove_patient_from_therapist(params[:therapist_id], params[:patient_id])
        if @data
            render json: {
                status: 200,
                patient: @data
            }
        else
            render json: {
                status: 500,
                errors: @data.errors.full_messages
            }
        end
    end

    private

    def therapists_params 
        params.require(:therapist).permit(:firstName, :lastName, :username, :email, :password, :password_confirmation, :location, :gender, :specialization, :image_url)
    end
end


