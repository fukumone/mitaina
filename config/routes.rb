Rails.application.routes.draw do
  root 'top#index'

  resources :top

  resources :evaluations, only: "" do
    collection do
      patch 'good', :defaults => { :format => 'json' }
      patch 'bad', :defaults => { :format => 'json' }
    end
  end

  resource :user do
    namespace :user, path: '/' do
      root 'top#index'
      get 'login' => 'sessions#new', as: :login
      resource :session, only: [ :create, :destroy ]
      resources :evaluation, only: "" do
        collection do
          get 'good', :defaults => { :format => 'json' }
          get 'bad', :defaults => { :format => 'json' }
        end
      end
    end
  end

end
