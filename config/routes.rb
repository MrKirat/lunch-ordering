Rails.application.routes.draw do
  namespace :admins do
    get 'users/index'
    get 'users/show'
  end
  devise_for :admins, path: 'admins', controllers: {
    sessions: 'admins/sessions'
  }
  namespace :admins do
    resources :users
  end

  get 'admins/dashboard'

  devise_for :users, path: '/', controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root 'home#index'
end
