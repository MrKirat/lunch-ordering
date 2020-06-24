Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: {
    sessions: 'admins/sessions'
  }
  namespace :admins do
    get '/calendars/month', to: 'calendars#month'
    get '/calendars/day', to: 'calendars#day'
    resources :users
    resources :food_menus, except: :destroy
    resources :orders, only: [:index, :show]
    get :dashboard
  end
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      namespace :admin do
        mount_devise_token_auth_for 'Admin', at: 'auth'
        resources :orders, only: :index
      end
    end
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
