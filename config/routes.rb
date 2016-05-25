Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
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
end
