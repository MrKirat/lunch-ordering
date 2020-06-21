Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: {
    sessions: 'admins/sessions'
  }
  namespace :admins do
    resources :users
    resources :food_menus, except: :destroy
    resources :orders, only: [:index, :show]
    get :dashboard
  end


  devise_for :users, path: '/', controllers: {
    registrations: 'registrations',
    sessions: 'sessions'
  }
  get 'menus/:id', to: 'food/menus#show', as: :food_menu
  resources :orders, except: [:destroy, :edit, :update]
  get :dashboard, to: 'users#dashboard'
  root 'home#index'
end
