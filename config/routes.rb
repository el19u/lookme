Rails.application.routes.draw do
  # 課程列表
  # /product/:id/buy_aloso

  # resources :products, only: [:index, :show]
  # get '/product/:id/buy_aloso', to: 'pages#courses'
  resources :courses
  
  root "pages#index"
  get "/about", to: "pages#about"

  # users function
  get "/sign_up", to: "users#sign_up"
  post "/account_verify", to: "users#account_verify"
  
  get "/sign_in", to: "users#sign_in"
  post "/sign_in/check", to: "users#check"


end