class UsersController < ApplicationController
    def index
        @users = User.all

        if @users
        render json: @users, each_serializer: UserSerializer
        
        else
        render json: {
            status: 500,
            errors: ['no users found']
        }
        end
    end
    def show
      @user = User.find(params[:id])
        if @user
        render json: @user, serializer: UserSerializer
        else
        render json: {
            status: 500,
            errors: ['user not found']
        }
        end
    end
  
  def create
    @user = User.new(user_params)
    if @user.save
      login!
      render json: {
        status: :created,
        user: @user
      }
    else 
      render json: {
        status: 500,
        errors: @user.errors.full_messages
      }
    end
  end

  def update
       @user = User.find(params[:id])

       if @user.update(user_params)
          render json: {
            status: :updated,
            user: @user
          }
       else
         render json: {
            status: 404,
            errors: @user.errors.full_messages
         }
       end
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      render json: {
        status: :deleted
      }
    else
      render json: {
        status: 404,
        errors: @user.errors.full_messages
      }
    end
  end

  def hours_slept_data
      data = User.getslepthoursdata(params[:id])
    
     if data
      render json: {
        status: 200,
        sleepinghoursdata: data
      }
    else
      render json: {
        status: 500,
        errors: data.errors.full_messages
      }
    end

  end

  def average_slept_hours
    data = User.getaverageslepthours(params[:id])

    if data 
        render json: {
        status: 200,
        averagesleepinghours: data
      } 
    else
        render json: {
        status: 500,
        errors: data.errors.full_messages
      }
    end
  end


  def average_mood_levels
    data = User.getAverageofallMoodlevels(params[:id])

    if data
      render json: {
        status: 200,
        averagemoodlevels: data
      }
    else
      render json: {
        status: 500,
        errors: data.errors.full_messages
      }
    end
  end

  def mood_array_data
    data = User.getMoodData(params[:id])

    if data
      render json: {
        status: 200,
        moodArrayData: data
      }
    else
      render json: {
        status: 500,
        errors: data.errors.full_messages
      }
    end
  end

  def mood_depressed_data
    data = User.getDepressedMoodData(params[:id])

    if data
      render json: {
        status: 200,
        moodDepressedData: data
      }
    else
      render json: {
        status: 500,
        errors: data.errors.full_messages
      }
    end
  end

  def mood_anxiety_data
     data = User.getAnxietyMoodData(params[:id])

     if data 
        render json: {
          status: 200,
          moodAnxietyData: data
        }
     else
      render json: {
        status: 500,
        errors: data.errors.full_messages
      }
     end
  end

  def mood_irritability_data
    data = User.getIrritabilityMoodData(params[:id])

    if data
      render json: {
        status: 200,
        moodIrritabilityData: data
      }
    else
      render json: {
        status: 500,
        errors: data.errors.full_messages
      }
    end
  end

  def mood_elevated_data
     data = User.getElevatedMoodData(params[:id])

     if data
      render json: {
        status: 200,
        moodElevatedData: data
      }
     else
      render json: {
        status: 500,
        errors: data.errors.full_messages
      }
     end
  end

  private
  
  def user_params
    params.require(:user).permit(:firstName, :lastName, :username, :email, :password, :password_confirmation, :location, :age, :occupation, :gender, :image)
  end
end

