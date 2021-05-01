Rails.application.routes.draw do
  resources :lessons
  resources :subjects
  devise_for :users
  get 'static/welcome'
  get 'users/about', to: 'static#about'
  get '/about', to: 'static#about'
  get '/chat', to: 'static#chat'
  get '/achievements', to: 'static#achievements'
  get '/home', to: 'static#welcome'
  get 'static/info', to: 'static#info'
  root 'static#welcome'
default_url_options :host => "www.gmail.com"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
