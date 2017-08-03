Rails.application.routes.draw do
  devise_for :users
  get "pages/*page_view", to: "pages#show", as: :pages
  root "pages#show", page_view: "home"

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
    root "pages#show", page: "home"
    resources :users, only: %i(index destroy)
    resources :categories
    resources :courses, except: :index
    resources :lessons, except: :index
    resources :words, except: %i(index show)
    resources :answers, except: %i(index show)
  end
end
