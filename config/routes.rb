Rails.application.routes.draw do
  get "pages/*page", to: "pages#show", as: :pages
  root "pages#show", page: "home"

  resources :categories, :courses, :lessons
end
