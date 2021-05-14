Rails.application.routes.draw do
	scope "(:locale)", locale: /en|fr/ do

	  resources :quizzes
	  resources :lessons do 
			member do
		    delete 'delete_image/:image_id', action: 'delete_image', as: 'delete_image'
		end
	  end
	  resources :subjects
	  devise_for :users
	  get 'quiz/restart', to: 'quizzes#restart'
	  get 'static/welcome', to: 'static#welcome'
	  get 'users/about', to: 'static#about'
	  get '/about', to: 'static#about'
	  get '/chat', to: 'static#chat'
	  get '/achievements', to: 'static#achievements'
	  get '/home', to: 'static#welcome'
	  get 'static/info', to: 'static#info'
		get '/passed', to: 'analysis#passed'
		get '/dash', to: 'static#admin_dash'
		get '/failed', to: 'analysis#failed'
	  get 'static/landing_page', to: 'static#landing_page'
	  root 'static#landing_page'
	default_url_options :host => "www.gmail.com"
	  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	end
end
