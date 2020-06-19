Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: {
    sessions: 'admins/sessions'
  }
  devise_for :users, path: 'users', controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  get 'admins/dashboard'
  root 'home#index'
end
