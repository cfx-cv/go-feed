Rails.application.routes.draw do
  # get '/app', to: 'app#index'

  scope "/app" do
    resources :restaurants do
      resources :menus, shallow: true # https://guides.rubyonrails.org/routing.html#shallow-nesting
    end

    resources :orders, only: [:index, :show, :create, :update, :destroy]

    # resources :users TODO
  end
end
