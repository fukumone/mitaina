Rails.application.routes.draw do
  namespace :user, path: '/' do
    root 'top#index'
    get 'login' => 'sessions#new', as: :login
    resource :session, only: [ :create, :destroy ]
  end

  namespace :api, path: '/' do
    resources :evaluations, only: '' do
      collection do
        patch 'good', :defaults => { :format => 'json' }
        patch 'bad', :defaults => { :format => 'json' }
      end
    end
  end

end
