Rails.application.routes.draw do
  root 'pages#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :receipts, except: :show do
        collection do
          get 'by_month'
        end
      end
    end
  end
end
