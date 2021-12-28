Rails.application.routes.draw do
  resources :articles
  resources :posts
  root "pages#home"
  get 'about', to: "pages#about"
  get 'signup', to: "users#new"
  resources :users, except: [:new]
end
