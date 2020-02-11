Rails.application.routes.draw do

  root "homepage#home"
  
  get "/signup" => "users#new"
  post "/signup" => "users#new"
  post "/users" => "users#create"

  get "/editprofile" => "users#edit"
  post "/users/:id" => "users#update"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/logout', to: 'sessions#new'

  get "/users/:id" => 'users#show', as: "user" #need to refactor for security

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
