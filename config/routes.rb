Rails.application.routes.draw do
  devise_for :users
  get "pages/*page", to: "pages#show", as: :pages
  root "pages#show", page: "home"

  resources :categories, :courses, :lessons, :enrolls
  resources :users, only: [:index, :show]

  resources :users do
    resources :followings, only: :index
    resources :followers, only: :index
  end

  resources :relationships, only: [:create, :destroy]
end
