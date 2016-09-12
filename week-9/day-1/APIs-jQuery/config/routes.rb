Rails.application.routes.draw do
  get 'definitions/show_def'

  get 'terms/definition'

  # root + 'name of controller= welcome #name of the action'
  root 'welcome#index'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'

  resource :session, only: [:new, :create, :destroy]

  resources :categories
  resources :terms
  resources :users

  get    'welcome/index'
  get    '/auth/:provider'          => 'omniauth#auth', as: :auth
  get    '/auth/:provider/callback' => 'session#create'
  get    '/auth/failure'            => 'session#failure'

  # For details on the DSL available within this file,
  # see http://guides.rubyonrails.org/routing.html
end
