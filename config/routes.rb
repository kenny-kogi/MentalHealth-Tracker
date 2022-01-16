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

  resources :users, only: [:create, :show, :index]
  resources :patients, only: [:create, :show, :index]
  resources :moods
  resources :therapists, only: [:create, :show, :index, :destroy]
end
