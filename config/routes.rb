Rails.application.routes.draw do
get '/login', to: 'sessions#new', as: :login
delete '/logout', to: 'sessions#delete', as: :logout
resources :sessions, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
resources :users, :beers, :ratings

end
