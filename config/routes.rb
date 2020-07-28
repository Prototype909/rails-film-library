Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#home'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'

  get '/login' => 'session#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'session#destroy'

  
  resources :users, only: [:new, :create, :show]
  resources :comments
  resources :films
end
