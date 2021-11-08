Rails.application.routes.draw do
  root "pages#index"
  get "/about", to: "pages#about"

  # users function
  get "/sign_up", to: "users#sign_up"
  post "/account_user", to: "account_verify"
end