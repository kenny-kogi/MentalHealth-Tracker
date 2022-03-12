class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token  
    helper_method :login!, :logged_in?, :current_user, :authorized_user?, :logout!
    def login!
        session[:user_id] = @user.id
    end
    def logged_in?
        !!session[:user_id]
    end
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    def authorized_user?
        @user == current_user
    end
    def logout!
        session.clear
    end

    def logged_in_patient?
        !!session[:patient_id]
    end

    def current_patient
        @current_patient ||= Patient.find(session[:patient_id]) if session[:patient_id]
    end

    def logged_in_therapist?
        !!session[:therapist_id]
    end

    def current_therapist
        @current_therapist ||= Therapist.find(session[:therapist_id]) if session[:therapist_id]
    end

    def logged_in_admin?
        !!session[:admin_id]
    end

    def current_admin
        @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
    end

end
