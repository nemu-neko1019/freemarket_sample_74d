Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  devise_for :users
  root 'items#index'
  resources :items do
    member do
      get "buy"
    end
    collection do
      get "complete_buy"
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
    end
  end
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end
