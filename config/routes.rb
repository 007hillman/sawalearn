Rails.application.routes.draw do
  devise_for :users
  get 'static/welcome'
  get 'users/about', to: 'static#about'
  root 'static#welcome'
default_url_options :host => "www.gmail.com"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
