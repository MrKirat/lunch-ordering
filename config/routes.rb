Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: {
    sessions: 'admins/sessions',
  }
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    registration: 'users/registrations'
  }
  get 'users/profile'
  get 'admins/dashboard'
  root 'home#index'
end
