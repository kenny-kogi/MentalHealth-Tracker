class MedicationsController < ApplicationController
    def index
        @medications = Medication.all

        if @medications
        render json: {
            status: 200,
            medications: @medications
        }      
        else
            render json: {
                status: 500,
                errors: ['No Medications are available currently']
            } 
        end
    end

    def create
        @medication = Medication.new(medications_params)
                                                                                                                                                                                                                        
        if @medication.save
            render json: {
                status: :created,
                patient: @medication
            }
        else
            render json: {
                status: 500,
                errors: @medication.errors.full_messages
            }
        end
    end

    def patient_medication
        @medication = Medication.where(patient_id: params[:id])

        if @medication
            render json: {
                status: :created,
                medications: @medication
            }
        else
            render json: {
                status: 500,
                errors: @medication.errors.full_messages
            }
        end
    end


    private

    def medications_params 
        params.require(:medication).permit(:drug_name, :prescription, :usage_interval, :patient_id)
    end

end