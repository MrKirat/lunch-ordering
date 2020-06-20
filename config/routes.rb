Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: {
    sessions: 'admins/sessions'
  }
  namespace :admins do
    resources :users
    resources :food_menus
    get :dashboard
  end


  devise_for :users, path: '/', controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  get 'menus/:id', to: 'food/menus#show', as: :food_menu
  get :dashboard, to: 'users#dashboard'
  root 'home#index'
end
