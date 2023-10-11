Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    resources :brands, only: [:index]
  end

  root to: 'api/brands#index'

  namespace :api do
    resources :brands, only: [:show] do
      resources :products, only: [:index], module: :brands
    end
  end
 
  namespace :api do
    resources :products, only: [:index]
  end

  namespace :api do
    resources :products, only: [:index, :show]
  end
  
  namespace :api do
    resources :cards, only: [:create]
  end
  
  namespace :api do
    post '/issue', to: 'issue#create'
  end
  
  namespace :api do
    get '/cards/:id', to: 'cards#show'
  end
end
