Rails.application.routes.draw do
  resources :monsters
  resources :tweets
  # root "tweets#index"
  root "tweets#index"
  get '/tweets/new/:id' ,to: 'tweets#new'
  delete "/tweets/delete_all", to: "tweets#delete_all"
end
