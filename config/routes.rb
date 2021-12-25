Rails.application.routes.draw do
  resources :articles
  resources :posts, only: [:show]
  root "pages#home"
  get 'about', to: "pages#about"

end
