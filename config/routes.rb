Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users, controllers: { invitations: 'users/invitations' }

  namespace :admin do
    resources :plans
    resources :features
    resources :usage
    resources :payments
  end   
  
  namespace :buyer do
    resources :plans, only: %i[index show]
    resources :subscriptions
    resources :consume_features do
      member do
        patch :increment_consumed_unit
      end
    end
    resources :payments do
      member do
        patch :payment_status
      end
    end
  end
  namespace :api do
    namespace :v1 do
      devise_scope :user do
        post 'signup', to: 'registrations#create'
        post 'signin', to: 'sessions#create'
        delete 'signout', to: 'sessions#destroy'
      end
      resources :plans
      post 'subscribe', to: 'subscriptions#create'
      delete 'unsubscribe', to: 'subscriptions#destroy'
    end
  end
end
