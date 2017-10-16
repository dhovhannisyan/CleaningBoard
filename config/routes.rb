Rails.application.routes.draw do

  resources :clients
  resources :cleaners
  resources :cities
  match '/bookings', to: "bookings#book", via: [:get, :post]
  match '/bookings/list', to: "bookings#list", via: [:get, :post]
  get '/home', to: 'home#welcome'
  get '/registration', to: 'clients#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  
  
  
  
  #get '/cities/:id/cleaners', to: "cities#cleaners"
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
