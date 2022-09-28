Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users, controllers: { invitations: 'users/invitations' }

  namespace :admin do
    resources :plans do
      resources :features
    end  
  end   
  
  namespace :buyer do
    resources :plans, only: %i[index show]
      resources :subscriptions do
        member do
          patch :increment_consumed_unit
        end
      end
  end
end
