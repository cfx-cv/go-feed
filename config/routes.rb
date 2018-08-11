Rails.application.routes.draw do
  resources :menus
  resources :orders, only: [:index, :show, :create, :update, :destroy]
  resources :restaurants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
