class AdminsSessionsController < ApplicationController
  def create
    @admin = Admin.find_by(email: session_params_admins[:email])
  
    if @admin && @admin.authenticate(session_params_admins[:password])
      session[:admin_id] = @admin.id
      render json: {
        logged_in: true,
        admin: @admin
      }
    else
      render json: { 
        status: 401,
        errors: ['no such Admin', 'verify credentials and try again or signup']
      }
    end
  end

  def is_logged_in?
    if logged_in_admin? && current_admin
      render json: {
        logged_in: true,
        admin: current_admin
      }
    else
      render json: {
        logged_in: false,
        message: 'no such Admin'
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
  def session_params_admins
    params.require(:admin).permit(:username, :email, :password)
  end
end