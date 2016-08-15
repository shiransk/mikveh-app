Rails.application.routes.draw do

#users  
get '/', to: 'users#dashboard_balanit'
get '/new_client', to:'users#new_client'
get '/new_balanit', to:'users#new_balanit'
post '/users', to:'users#create'

#sessions

get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
get '/logout', to: 'sessions#destroy'

#booking
 get '/bookings', to: 'bookings#new'
 post '/bookings', to: 'bookings#create'
 get '/bookings', to: 'bookings#show'
 delete 'bookings', to: 'bookings#destroy'
 

#mikveh
get '/mikveh', to: 'mikvehs#new'
post '/mikveh', to: 'mikvehs#create'
get '/mikveh/:id', to: 'mikvehs#show'

end
