Rails.application.routes.draw do
  get 'dashboard/index'

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks", :registrations => "my_registrations" }


  resources :posts do
  	member do
  		put "like" => "posts#upvote"
  		put "dislike" => "posts#downvote"
  	end
  end
  get 'home/index'
  root 'home#index'
  get '/got' => 'got_home#index', as: 'got'
  get '/twd' => 'twd_home#index', as: 'twd'
  get '/robot' => 'robot#index', as: 'robot'
  get '/vikings' => 'vikings#index', as: 'vikings'
  get '/extras' => 'extras#index', as: 'extras'
  get '/dashboard' => 'dashboard#index', as: 'dashboard'
  resources :contacts, only: [:new, :create]
  get '/premios' => 'premios#index', as: 'premios'


  get '*path' => redirect('/')
end
