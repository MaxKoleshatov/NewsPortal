Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  root to: 'welcome#index'

  get 'welcome/show'

  # namespace :admin do
  #   resources :admins
  # end


  resources :categories do
    resources :articles, shallow: true do
      resources :comments
    end
  end
end
