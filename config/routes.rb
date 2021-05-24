Rails.application.routes.draw do
  resources :todos, :users
  post "users/login", to: "users#login"
end
