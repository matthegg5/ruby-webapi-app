Rails.application.routes.draw do
  resources :friends
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "api/friend/all", controller: "friend", action: :all
  get "api/friend/:id", to: 'friend#get_friend'
  put "api/friend/:id", to: 'friend#update'
  delete "api/friend/:id", to: 'friend#destroy'
  post "api/friend", to: 'friend#create'

  # Defines the root path route ("/")
  # root "posts#index"
end
