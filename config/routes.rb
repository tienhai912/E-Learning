Rails.application.routes.draw do
  devise_for :users
  get "pages/*page", to: "pages#show", as: :pages
  root "pages#show", page: "home"
end
