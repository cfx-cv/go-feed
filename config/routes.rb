Rails.application.routes.draw do
  # get "/app", to: "app#index"

  scope "/app" do
    resources :restaurants do
      resources :menus
    end

    resources :orders, only: [:index, :show, :create, :update, :destroy]

    resources :menus, :drivers

    resources :user_sessions, only: [:create]
    get "/login", to: "user_sessions#new"
    delete "/logout", to: "user_sessions#destroy"

    resources :users, only: [:index, :show, :edit, :create, :update, :destroy]
    get "/register", to: "users#new"
  end
end
