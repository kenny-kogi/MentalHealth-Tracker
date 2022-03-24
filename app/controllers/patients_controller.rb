class PatientsController < ApplicationController
    def index
        @patients = Patient.all
        if @patients
            render json: {
                patients: @patients
            }
        else
            render json: {
                status: 404,
                errors: ['No Patient found']
            }
        end
    end

    def show
        @patient = Patient.find(params[:id])

        if @patient 
            render json: {
                patient: @patient
            }
        else
            render json: {
                status: 404,
                errors: ['Patient not found']
            }
        end
    end

    def update
       @patient = Patient.find(params[:id])

       if @patient.update(patient_params)
          render json: {
            status: :updated,
            patient: @patient
          }
       else
         render json: {
            status: 404,
            errors: @patient.errors.full_messages
         }
       end
    end

    def create
        @patient = Patient.new(patient_params)

        if @patient.save
            session[:patient_id] = @patient.id
            render json: {
                status: :created,
                patient: @patient
            }
        else
            render json: {
                status: 500,
                errors: @patient.errors.full_messages
            }
        end
    end

    def destroy
    @patient = Patient.find(params[:id])

    if @patient.destroy
      render json: {
        status: :deleted
      }
    else
      render json: {
        status: 404,
        errors: @patient.errors.full_messages
      }
    end
  end

  def hours_slept_data
      data = Patient.getslepthoursdata(params[:id])
    
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
    data = Patient.getaverageslepthours(params[:id])

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
    data = Patient.getAverageofallMoodlevels(params[:id])

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
    data = Patient.getMoodData(params[:id])

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
    data = Patient.getDepressedMoodData(params[:id])

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
     data = Patient.getAnxietyMoodData(params[:id])

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
    data = Patient.getIrritabilityMoodData(params[:id])

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
     data = Patient.getElevatedMoodData(params[:id])

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

    def patient_params 
        params.require(:patient).permit(:firstName, :lastName, :username, :email, :password, :password_confirmation, :location, :age, :occupation, :gender, :image_url, :mental_health_status, :mental_health_facility, :therapist_id)
    end

end


