class FeedbacksController < ApplicationController
    def index
        @feedbacks = Feedback.all

        if @feedbacks
            render json: {
                status: :ok,
                feedbacks: @feedbacks,
            }
        else
            render json: {
                status: 404,
                errors: ['No Feedback found']
            }
        end
    end

    def create
        @feedback = Feedback.new(feedback_params)

        if @feedback.save
            render json: {
                status: :created,
                feedback: @feedback
            }
        else
            render json: {
                status: 500,
                errors: @feedback.errors.full_messages
            }
        end
    end


    private
    def feedback_params
        params.require(:feedback).permit(:title, :body, :patient_id, :therapist_id)
    end
end
