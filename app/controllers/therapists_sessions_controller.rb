class TherapistsSessionsController < ApplicationController
  def create
    @therapist = Therapist.find_by(email: session_params_therapists[:email])
  
    if @therapist && @therapist.authenticate(session_params_therapists[:password])
      session[:therapist_id] = @therapist.id
      render json: {
        logged_in: true,
        user: @therapist
      }
    else
      render json: { 
        status: 401,
        errors: ['no such Therapist', 'verify credentials and try again or signup']
      }
    end
  end

  def is_logged_in?
    if logged_in_therapist? && current_therapist
      render json: {
        logged_in: true,
        user: current_therapist
      }
    else
      render json: {
        logged_in: false,
        message: 'no such therapist'
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
  def session_params_therapists
    params.require(:therapist).permit(:username, :email, :password)
  end   
end