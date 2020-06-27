Rails.application.routes.draw do
  # Admins
  devise_for :admins, path: 'admin', controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    get '/calendars/month', to: 'calendars#month'
    get '/calendars/day', to: 'calendars#day'
    get '/dashboard', to: 'dashboard#show'
    resources :users
    namespace :food do
      resources :menus, except: :destroy
    end
    resources :orders, only: [:index, :show]
  end

  # Users
  devise_for :users, path: '/', controllers: {
    registrations: 'user/registrations',
    sessions: 'user/sessions'
  }
  scope module: :user do
    get '/menus/:id', to: 'food/menus#show', as: :food_menu
    get '/dashboard', to: 'dashboard#show'
    resources :orders, except: [:destroy, :edit, :update]
  end

  # Common
  root 'home#index'

  # API
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      namespace :admin do
        mount_devise_token_auth_for 'Admin', at: 'auth', :skip => ['password']
        resources :orders, only: :index
      end
    end
  end
end
