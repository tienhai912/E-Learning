Rails.application.routes.draw do
  get "/*page", to: "pages#show", as: :pages
  root "pages#show", page: "home"
end
