Rails.application.routes.draw do
  
  post '/login',    to: 'sessions#create'
  post '/logout',   to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'

  resources :artists, only: [:create, :show, :index]
  
end
