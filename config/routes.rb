Rails.application.routes.draw do

#users 
get '/client_calender', to: 'users#client_calender'
get '/', to: 'users#index'
get '/index', to: 'users#index'
get '/dashboard_balanit', to: 'users#dashboard_balanit'
get '/dashboard_client', to: 'users#dashboard_client'
get '/calendar', to: 'users#calendar'
get '/new_client', to:'users#new_client'
get '/new_balanit', to:'users#new_balanit'
post '/users', to:'users#create'

#sessions
get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
get '/logout', to: 'sessions#destroy'

#booking
 get '/bookings/new', to: 'bookings#new'
 post '/bookings', to: 'bookings#create'
 patch '/bookings/:id', to: 'bookings#update'
 get 'bookings/:id/edit', to: 'bookings#edit'
 get '/bookings/:id', to: 'bookings#show'
 delete '/bookings/:id', to: 'bookings#destroy'

#mikveh
get '/mikveh', to: 'mikvehs#new'
post '/mikveh', to: 'mikvehs#create'
get '/mikveh/:id', to: 'mikvehs#show'

  namespace :api do 
    namespace :v1 do 
      get '/mikveh', to: 'mikvehs#index'
    end
  end

end
