Rails.application.routes.draw do
  resources :users, only: [:index, :show, :edit, :create, :update, :destroy]
  get "/register", to: "users#new"

  resources :user_sessions, only: [:create]
  get "/login", to: "user_sessions#new"
  delete "/logout", to: "user_sessions#destroy"

  # get "/app", to: "app#index"

  scope "/app" do
    resources :restaurants do
      resources :menus, shallow: true # https://guides.rubyonrails.org/routing.html#shallow-nesting
    end

    resources :orders, only: [:index, :show, :create, :update, :destroy]
  end
end
