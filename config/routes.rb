Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :posts
  get 'home/index'
  root 'home#index'
  get '/got' => 'got_home#index', as: 'got'
  get '/twd' => 'twd_home#index', as: 'twd'
end
