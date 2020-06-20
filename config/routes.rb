Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: {
    sessions: 'admins/sessions'
  }
  namespace :admins do
    resources :users
    resources :food_menus
  end

  get 'admins/dashboard'

  devise_for :users, path: '/', controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root 'home#index'
end
