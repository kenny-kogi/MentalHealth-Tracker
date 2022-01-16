class SessionsController < ApplicationController
  def create
    @patient = Patient.find_by(email: session_params[:email])
  
    if @patient && @patient.authenticate(session_params[:password])
      session[:patient_id] = @patient.id
      render json: {
        logged_in: true,
        user: @user
      }
    else
      render json: { 
        status: 401,
        errors: ['no such patient', 'verify credentials and try again or signup']
      }
    end
  end
  def is_logged_in?
    if logged_in_patient? && current_patient
      render json: {
        logged_in: true,
        user: current_patient
      }
    else
      render json: {
        logged_in: false,
        message: 'no such patient'
      }
    end
  end
  def destroy
    logout!
    render json: {
      status: 200,
      logged_out: true
    }
  end
  private
  def session_params
    params.require(:patient).permit(:username, :email, :password)
  end
end