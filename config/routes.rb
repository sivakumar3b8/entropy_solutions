Rails.application.routes.draw do
  resources :friends

  root "home#index"

  devise_for :users
end
