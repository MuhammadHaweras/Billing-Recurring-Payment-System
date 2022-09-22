Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users

  namespace :admin do
    resources :plans do
      resources :features
    end  
  end   
  
  namespace :buyer do
    resources :users
  end  
end
