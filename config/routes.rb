Rails.application.routes.draw do

  # Home
  get '/home', to: 'home#welcome'

  # Admin
  match 'admin/filter/client', to: 'admin/filter#client_filter', via: [:get, :post]
  match 'admin/filter/cleaner', to: 'admin/filter#cleaner_filter', via: [:get, :post]

  # Registration
  get '/registration/client', to: 'registration#for_client'
  post '/registration/client', to: 'registration#create_client'
  get '/registration/cleaner', to: 'registration#for_cleaner'
  post '/registration/cleaner', to: 'registration#create_cleaner'
  
  # Login
  get '/login/client', to: 'sessions#for_client' 
  post '/login/client', to: 'sessions#create_client'
  get '/login/cleaner', to: 'sessions#for_cleaner' 
  post '/login/cleaner', to: 'sessions#create_cleaner'
  
  # Logout
  get '/logout_client', to: 'sessions#destroy_client'
  get '/logout_cleaner', to: 'sessions#destroy_cleaner'

  # Client Page
  get '/client/page', to: 'clients#page', as: :client_page
  get '/cleaner/page', to: 'cleaners#page', as: :cleaner_page
  
  # Client Delete
  delete '/client/delete', to: 'clients#destroy'
  
  #Cleaner Delete
  delete '/cleaner/delete', to: 'cleaners#destroy'

  # Client Edit 
  get '/cleaner/edit', to: 'cleaners#edit'
  post '/cleaner/edit', to: 'cleaners#update'

  #Cleaner Edit
  get '/client/edit', to: 'clients#edit'
  post '/client/edit', to: 'clients#update'
  
  # Client Booking
  get '/client/booking', to: 'bookings#book'
  post '/client/booking/check_cleaner', to: 'bookings#check_cleaner'
  post '/client/booking', to: 'bookings#create'
  

  # Cleaner Bookings
  get 'cleaner/bookings', to: 'cleaners#bookings'
  post '/cleaner/booking/:id', to: 'bookings#show', as: :cleaner_booking
  
  #Client Bookings
  get 'client/bookings', to: 'clients#bookings'

  #Cleaner edit password
  get 'cleaner/edit/password', to: 'cleaners#edit_password'
  post 'cleaner/edit/password', to: 'cleaners#change_password'

  #Client edit password
  get 'client/edit/password', to: 'clients#edit_password'
  post 'client/edit/password', to: 'clients#change_password'

  #Cleaner edit city
  match 'cleaner/edit/city', to: 'cleaners#edit_city', via: [:get, :post]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
