class MoodsController < ApplicationController
    before_action :mood_params, only: %i[ edit update create ]
    def index
        @moods = Mood.all

        if @moods
        render json: @moods, each_serializer: MoodSerializer
            
        else
            render json: {
                status: 500,
                errors: ['No moods are available currently']
            } 
        end
    end

    def show_mood_user
        @moods = Mood.where(user_id: params[:id])
        if @moods
        render json: {
            moods: @moods
        }
        else
        render json: {
            status: 500,
            errors: ['Mood not found']
        }
        end
    end

   def show_mood_patient
        @moods = Mood.where(patient_id: params[:id])
        if @moods
        render json: {
            moods: @moods
        }
        else
        render json: {
            status: 500,
            errors: ['Mood not found']
        }
        end
    end

    def create
        @mood = Mood.new(mood_params)
        if @mood.save
        render json: {
            status: :created,
            mood: @mood
        }
        else 
        render json: {
            status: 500,
            errors: @mood.errors.full_messages
        }
        end
    end

  
    
    def update
        @mood = Mood.find(params[:id])

        if @mood.update(mood_params)
            render json: {
                status: :updated,
                mood: @mood
            }
        else
            render json: {
                status: 500,
                errors: @mood.errors.full_messages
            }
        end
    end

    def destroy
        @mood = Mood.find(params[:id])
        @mood.destroy

        render json: {
            status: :deleted
        }
    end


    private

    def mood_params  
        params.require(:mood).permit(:hours_slept, :depressed, :anxiety, :irritability_level, :elevated_level, :psychotic_symptoms, :weather, :user_id, :patient_id, :activity, :mood_note)
    end
end