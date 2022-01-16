Rails.application.routes.draw do

  ## User sessions routes
  post 'user/login', to: 'users_sessions#create'
  delete 'user/logout', to: 'users_sessions#destroy'
  get 'user/logged_in', to: 'users_sessions#is_logged_in?'

  ## Patients sessions routes
  post 'patient/login', to: 'patients_sessions#create'
  delete 'patient/logout', to: 'patients_sessions#destroy'
  get 'patient/logged_in', to: 'patients_sessions#is_logged_in?'

  resources :users, only: [:create, :show, :index]
  resources :patients, only: [:create, :show, :index]
  resources :moods
end
