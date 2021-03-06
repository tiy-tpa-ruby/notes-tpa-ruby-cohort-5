Rails.application.routes.draw do
  # means /   'controller-name#action'
  root 'homepage#homepage'

  # Instead go to the list page for teams as the homepage
  # root 'teams#index'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'

  resources :players
  resources :teams

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
