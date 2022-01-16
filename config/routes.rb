Rails.application.routes.draw do
  post 'user/login', to: 'sessions#create'
  delete 'user/logout', to: 'sessions#destroy'
  get 'user/logged_in', to: 'sessions#is_logged_in?'

  post 'patient/login', to: 'patient/sessions#create'
  delete 'patient/logout', to: 'patient/sessions#destroy'
  get 'patient/logged_in', to: 'patient/sessions#is_logged_in?'
  resources :users, only: [:create, :show, :index]
  resources :patients, only: [:create, :show, :index]
  resources :moods
end
