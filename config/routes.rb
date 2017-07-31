Rails.application.routes.draw do
  devise_for :users
  get "pages/*page", to: "pages#show", as: :pages
  root "pages#show", page: "home"

  resources :courses, only: :show do
    resources :lessons, only: :show
  end

  resources :users, only: %i(index show) do
    resources :enrolls, only: %i(new create)
    resources :followings, only: :index
    resources :followers, only: :index
  end

  resources :categories
  resources :relationships, only: [:create, :destroy]
end
