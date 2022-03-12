class AdminsController < ApplicationController

    def index
        @admin = Admin.all
        if @admin
            render json: {
                admin: @admin
            }
        else
            render json: {
                status: 404,
                errors: ['No Admin found']
            }
        end
    end
    def create
        @admin = Admin.new(admin_params)

        if @admin.save
            session[:admin_id] = @admin.id
            render json: {
                status: :created,
                admin: @admin
            }
        else
            render json: {
                status: 500,
                errors: @admin.errors.full_messages
            }
        end
    end

    private

    def admin_params 
        params.require(:admin).permit(:firstName, :lastName, :username, :email, :password, :password_confirmation)
    end

end