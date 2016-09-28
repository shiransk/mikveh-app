Rails.application.routes.draw do

  get 'rooms/show'

  get 'comments/new'

  get 'comments/create'

#users
get '/users', to: 'users#index' 
get '/client_calender', to: 'users#client_calender'
get '/dashboard_balanit', to: 'users#dashboard_balanit'
get '/dashboard_client', to: 'users#dashboard_client'
get '/calendar', to: 'users#calendar'
get '/new_client', to:'users#new_client'
get '/new_balanit', to:'users#new_balanit'
post '/users', to:'users#create'
get '/users/:id/edit', to: 'users#edit'
get '/users/:id', to: 'users#show'
patch '/users/:id', to: 'users#update'

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
get '/', to: 'mikvehs#index'
get '/index_map', to: 'mikvehs#index_map'
get '/index', to: 'mikvehs#index'
get '/mikvehs', to: 'mikvehs#new'
post '/mikvehs', to: 'mikvehs#create'
get '/mikvehs/:id', to: 'mikvehs#show'
get '/mikvehs/:id/edit', to: 'mikvehs#edit'
patch 'mikvehs/:id', to: 'mikvehs#update'

#Posts
get '/posts', to: 'posts#index'
get '/posts/new', to: 'posts#new'
post '/posts', to: 'posts#create'
get '/posts/:id', to: 'posts#show'
get '/posts/:id/edit', to: 'posts#edit'
patch '/posts/:id', to: 'posts#update'
delete '/posts/:id', to: 'posts#destroy'

#Comments
get '/comments/new', to: 'comments#new'
get '/comments/:id', to: 'comments#show'
post '/comments', to: 'comments#create'
get '/comments/:id/edit', to: 'comments#edit'
patch '/comments/:id', to: 'comments#update'
delete '/comments/:id', to: 'comments#destroy'


#ActionCable
# mount ActionCable.server => '/cable'
# get '/rooms', to: 'rooms#show'

#chat_rooms
get '/chats/:id', to: 'chat_rooms#show'


  namespace :api do 
    namespace :v1 do 
      get '/mikveh', to: 'mikvehs#index'
    end
  end

end
