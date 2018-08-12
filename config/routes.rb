Rails.application.routes.draw do
  # get '/app', to: 'app#index'

  scope '/app' do
    resources :restaurants do
      resources :menus
    end
    resources :orders, only: [:index, :show, :create, :update, :destroy]
    resources :menus, :drivers
  end
end
