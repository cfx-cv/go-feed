Rails.application.routes.draw do
  resources :users, only: [:index, :show, :edit, :create, :update, :destroy]
  get "/register/:role", to: "users#new", as: "register"

  get "/login", to: "user_sessions#new", as: "login"
  post "/login", to: "user_sessions#create", as: "login_post"
  delete "/logout", to: "user_sessions#destroy", as: "logout"

  scope "/app" do
    resources :restaurants do
      resources :menus, shallow: true
    end

    resources :orders, only: [:index, :show, :create, :update, :destroy]
  end
  get "/app", to: "app#index"

  root "static_pages#landing"
end
