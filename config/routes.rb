Rails.application.routes.draw do
  resources :articles
  resources :posts
  resources :users, except: [:new]

  root "pages#home"
  get 'about', to: "pages#about"
  get 'signup', to: "users#new"
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
# create login in route, using controller session, and then add the new action to it.

end
