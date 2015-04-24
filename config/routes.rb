Rails.application.routes.draw do
  root 'pages#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # Authentication
      post '/authenticate', to: 'authentication#authenticate'

      # Receipts
      resources :receipts, except: :show
    end
  end
end
