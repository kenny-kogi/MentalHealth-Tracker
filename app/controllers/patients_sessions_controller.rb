class PatientsSessionsController < ApplicationController
  def create
    @patient = Patient.find_by(email: session_params_patients[:email])
  
    if @patient && @patient.authenticate(session_params_patients[:password])
      session[:patient_id] = @patient.id
      render json: {
        logged_in: true,
        patient: @patient
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
        patient: current_patient
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
  def session_params_patients
    params.require(:patient).permit(:username, :email, :password)
  end
end