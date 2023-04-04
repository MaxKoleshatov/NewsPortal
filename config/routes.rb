Rails.application.routes.draw do
  
  devise_for :users

  root to: 'welcome#index'

  get 'welcome/show'

  resources :categories do
    resources :articles, shallow: true do
      resources :comments
    end
  end
end
