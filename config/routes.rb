Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :show, :new, :index, :edit, :update]
  resources :places, only: [:new, :create, :show, :index, :edit, :destroy]
  resources :comments, only: [:new, :create]
  get '/', to: 'static#welcome'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/home/:id', to: 'users#home'
  post '/home/:id', to: 'places#create'

  post '/places/:id', to: 'places#update'
  # get '/users/signup', to: 'users#new'
  # post '/places/:id', to: 'comments#new'
  get '/search', to: 'search#search'
  get '/places/add/:id', to: 'places#add'
  post '/places/add/:id', to: 'places#added'
end
