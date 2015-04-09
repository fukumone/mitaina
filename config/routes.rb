class UserNamespaceConstraint
  def self.matches?(request)
    arr = request.path_info.split("/")
    arr.count > 1 && User.exists?(display_name: arr[1])
  end
end

Rails.application.routes.draw do
  root 'top#index'
  get 'login' => 'sessions#new', as: :login
  resource :session, only: [ :create, :destroy ]

  constraints(UserNamespaceConstraint) do
    scope "/:display_name" do
      namespace :user, path: '/' do
        root 'top#index'
        post 'top', to: "top#create"
      end
    end
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
