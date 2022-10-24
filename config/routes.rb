Rails.application.routes.draw do
  resources :monsters
  resources :tweets
  # root "tweets#index"
  root "tweets#index"
  get '/tweets/new/:id' ,to: 'tweets#new'
end
