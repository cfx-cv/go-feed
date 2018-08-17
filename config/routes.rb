Rails.application.routes.draw do
  resources :users, only: [:index, :show, :edit, :create, :update, :destroy]
  get "/register/:role", to: "users#new", as: "register"

  resources :user_sessions, only: [:create]
  get "/login", to: "user_sessions#new", as: "login"
  delete "/logout", to: "user_sessions#destroy", as: "logout"
  
  get "/app", to: "app#index"

  scope "/app" do
    resources :restaurants do
      resources :menus, shallow: true
    end

    resources :orders, only: [:index, :show, :create, :update, :destroy]
  end

  root "static_pages#landing"
end
