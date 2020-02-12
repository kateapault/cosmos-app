Rails.application.routes.draw do

  get '/cis/search', to: 'cis#search'
  get '/cis/index', to: 'cis#index', as: 'filtered_path'
  resources :ucs

  root "homepage#home"
  
  get '/cocktails', to: 'cocktails#index'
  get '/cocktails/new', to: 'cocktails#new', as: 'new_cocktail'
  post '/cocktails', to: 'cocktails#create'
  get '/cocktails/:id', to: 'cocktails#show', as: 'cocktail'
  get '/cocktails/:id/edit', to: 'cocktails#edit', as: 'edit_cocktail'
  patch '/cocktails/:id', to: 'cocktails#update'
  delete '/cocktails/:id', to: 'cocktails#destroy'

  get '/ingredients', to: 'ingredients#index'
  get '/ingredients/new', to: 'ingredients#new', as: 'new_ingredient'
  post '/ingredients', to: 'ingredients#create'
  get '/ingredients/:id', to: 'ingredients#show', as: 'ingredient'
  get '/ingredients/:id/edit', to: 'ingredients#edit', as: 'edit_ingredient'
  patch '/ingredients/:id', to: 'ingredients#update'
  delete '/ingredients/:id', to: 'ingredients#destroy'

  get "/signup" => "users#new"
  post "/signup" => "users#new"
  post "/users" => "users#create"

  get "/editprofile" => "users#edit"
  patch "/users/:id" => "users#update"

  get "/delete" => "users#destroy"
  post "/" => "users#destroy"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/logout', to: 'sessions#new'

  get "/users/:id" => 'users#show', as: "user" #need to refactor for security

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
