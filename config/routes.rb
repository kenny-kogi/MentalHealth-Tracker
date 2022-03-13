Rails.application.routes.draw do

  ## User sessions routes
  post 'user/login', to: 'users_sessions#create'
  delete 'user/logout', to: 'users_sessions#destroy'
  get 'user/logged_in', to: 'users_sessions#is_logged_in?'

  ## Patients sessions routes
  post 'patient/login', to: 'patients_sessions#create'
  delete 'patient/logout', to: 'patients_sessions#destroy'
  get 'patient/logged_in', to: 'patients_sessions#is_logged_in?'

  ##Therapist session routes
  post 'therapist/login', to: 'therapists_sessions#create'
  delete 'therapist/logout', to: 'therapists_sessions#destroy'
  get 'therapist/logged_in', to: 'therapists_sessions#is_logged_in?'

  ##Admin sessions
  post 'admin/login', to: 'admins_sessions#create'
  delete 'admin/logout', to: 'admins_sessions#destroy'
  get 'admin/logged_in', to: 'admins_sessions#is_logged_in?'

  ## User

  ## get user moods

  get "moods/user/:id", to: 'moods#show_mood_user'
  ## Query hours slept
  get 'users/hours_data/:id', to: "users#hours_slept_data"
  ## Query Average hours slept
  get 'users/average_hours_data/:id', to: "users#average_slept_hours"
  ## Query Average Mood Levels
  get 'users/average_mood_levels/:id', to: "users#average_mood_levels"
  ## Query Mood Array Data
  get 'users/mood_array_data/:id', to: "users#mood_array_data"
  ## Query Depressed Mood Data
  get 'users/mood_depressed_data/:id', to: "users#mood_depressed_data"
  ## Query Irritability Mood Data
  get 'users/mood_irritability_data/:id', to: "users#mood_irritability_data"
  ## Query Anxiety Mood Data
  get 'users/mood_anxiety_data/:id', to: "users#mood_anxiety_data"  
  ## Query Elevated Mood Data
  get 'users/mood_elevated_data/:id', to: "users#mood_elevated_data"  

  ## Patient

  ## get Patient Moods
  get "moods/patient/:id", to: "moods#show_mood_patient"
  ## Query hours slept
  get 'patients/hours_data/:id', to: "patients#hours_slept_data"
  ## Query Average hours slept
  get 'patients/average_hours_data/:id', to: "patients#average_slept_hours"
  ## Query Average Mood Levels
  get 'patients/average_mood_levels/:id', to: "patients#average_mood_levels"
  ## Query Mood Array Data
  get 'patients/mood_array_data/:id', to: "patients#mood_array_data"
 ## Query Depressed Mood Data
  get 'patients/mood_depressed_data/:id', to: "patients#mood_depressed_data"
  ## Query Irritability Mood Data
  get 'patients/mood_irritability_data/:id', to: "patients#mood_irritability_data"
  ## Query Anxiety Mood Data
  get 'patients/mood_anxiety_data/:id', to: "patients#mood_anxiety_data"  
  ## Query Elevated Mood Data
  get 'patients/mood_elevated_data/:id', to: "patients#mood_elevated_data"  

  ## Update Patient Details
 


  ## Therapist


  ## get All Patients
  get "therapists/patients/:id", to: "therapists#get_all_patients"

  ## Remove Patient from Therapist List
  get "therapists/remove_patient/:therapist_id/:patient_id", to: "therapists#remove_patient_from_therapist"

  ## Feedback

  ## get Patient Feedbacks
  get "patient/feedback/:id", to: "feedbacks#get_therapist_feedback"


  ## Admin


  resources :users, only: [:create, :show, :index]
  resources :patients, only: [:create, :show, :index, :update]
  resources :moods
  resources :therapists
  resources :feedbacks
  resources :admins
  resources :medications
end
