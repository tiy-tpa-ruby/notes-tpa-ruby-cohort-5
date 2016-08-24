Rails.application.routes.draw do
  resources :players
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'players#index'
end
