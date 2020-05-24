Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    member do
      get "buy"
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    collection do
      get "complete_buy"
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :users do
    get 'users/:name', controller: 'users', action: 'edit'
    
  end
  resources :signup, only: [:index, :create, :destroy] do
    collection do
      get "step1"
      get "step2" 
      get "complete_signup"
      get 'logout'
      get "complete_logout"
      get "choice"
    end
  end
  resources :card, only: [:new, :show, :delete] do
    member do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  resources :purchase, only: [:index] do
    member do
      get 'confirmation', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end
end
