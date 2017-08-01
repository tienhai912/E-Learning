Rails.application.routes.draw do
  devise_for :users
  get "pages/*page", to: "pages#show", as: :pages
  root "pages#show", page: "home"

  resources :courses do
    resources :lessons, only: :show
  end

  resources :categories
  resources :users do
    resources :enrolls, only: %i(new create)
  end
end
