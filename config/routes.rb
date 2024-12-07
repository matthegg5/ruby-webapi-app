Rails.application.routes.draw do
  resources :friends
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "api/friend/all", controller: "friend", action: :all
  get "api/friend/:id", to: 'friend#get_friend'
  put "api/friend/:id", to: 'friend#update'
  delete "api/friend/:id", to: 'friend#destroy'
  post "api/friend", to: 'friend#create'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
