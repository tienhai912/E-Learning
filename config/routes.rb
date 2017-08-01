Rails.application.routes.draw do
  devise_for :users
  get "pages/*page", to: "pages#show", as: :pages
  root "pages#show", page: "home"

  resources :courses, only: :show do
    resources :lessons, only: :show
  end

  resources :users, only: %i(index show) do
    resources :enrolls, only: %i(new create)
  end

  resources :categories
  resources :relationships, only: %i(index create destroy)
  resources :tests, :results

  namespace :admin do
    resources :categories
    resources :courses
  end
end
