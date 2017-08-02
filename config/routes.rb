Rails.application.routes.draw do
  devise_for :users
  get "pages/*page_view", to: "pages#show", as: :pages
  root "pages#show", page_view: "home"

  resources :courses, only: :show do
    resources :lessons, only: :show
  end

  resources :users, only: %i(index show) do
    resources :enrolls, only: %i(new create)
    resources :lessons, only: :index
    resources :words, only: :index
  end

  resources :categories
  resources :relationships, only: %i(index create destroy)
end
