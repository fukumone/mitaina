Rails.application.routes.draw do
  root 'top#index'

  resources :top

  namespace :api, path: '/' do
    resources :evaluations, only: '' do
      collection do
        patch 'good', :defaults => { :format => 'json' }
        patch 'bad', :defaults => { :format => 'json' }
      end
    end
  end

  namespace :user, path: '/' do
    root 'top#index'
    get 'login' => 'sessions#new', as: :login
    resource :session, only: [ :create, :destroy ]
  end

end
