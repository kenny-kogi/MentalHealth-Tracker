Rails.application.routes.draw do
  post 'user/login', to: 'sessions#create'
  delete 'user/logout', to: 'sessions#destroy'
  get 'user/logged_in', to: 'sessions#is_logged_in?'
  resources :users, only: [:create, :show, :index]
  resources :moods
end
