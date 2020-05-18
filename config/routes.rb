Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    member do
      get "buy"
    end
    collection do
      post 'items/create' => 'items#create'
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
      get "choice"z
    end
  end
end
