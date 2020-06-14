Rails.application.routes.draw do
  devise_for :admins, path: 'admins'
  devise_for :users, path: 'users', controllers: {
    registrations: 'users/registrations'
  }
  get 'users/profile'
  get 'admins/dashboard'
  root 'home#index'
end
