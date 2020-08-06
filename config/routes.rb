Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#home'

  # Routes for Google authentication
  get 'auth/:provider/callback', to: 'sessions#omniauth'
 
  get 'auth/failure', to: redirect('/')
  

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  delete '/logout' => 'sessions#destroy'

  get '/films/favorite' => 'films#favorite'

    
  resources :users, only: [:new, :create, :show,]
  resources :comments

  resources :films do
    resources :comments     
    end
    
end
