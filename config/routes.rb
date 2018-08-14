Rails.application.routes.draw do
  # get '/app', to: 'app#index'
  scope '/app' do
    resources :restaurants do
      resources :menus
    end

    resources :orders, only: [:index, :show, :create, :update, :destroy]

    resources :menus, :drivers

    resources :users
    
    get "/register", to: "users#new"

    resource :user_sessions, only: [:new, :create, :destroy]
    get "/login", to: "user_sessions#new"
    delete "/logout", to: "user_sessions#destroy"
  end
end
