Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :courses, only: [] do
        member do
          post :like
        end
      end
    end
  end

  # 課程列表
  # /product/:id/buy_aloso

  # resources :products, only: [:index, :show]
  # get '/product/:id/buy_aloso', to: 'pages#courses'
  resources :courses do
    resources :reviews, only: [:create]
  end
  resources :reviews, only: [:destroy]
  
  root "pages#index"
  get "/about", to: "pages#about"

  # users function
  get "/sign_up", to: "users#sign_up"
  post "/account_verify", to: "users#account_verify"
  
  get "/sign_in", to: "users#sign_in"
  post "/sign_in/check", to: "users#check"
  delete "/sign_out", to: "users#sign_out"

end