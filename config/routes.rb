Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    member do
      get "buy"
      get "category"
    end
    collection do
      get "complete_buy"
    end
  end
  resources :users, except: :index do
    get 'users/:name', controller: 'users', action: 'edit'
    collection do
      get "address"
      get "complete_signup"
      get "complete_logout"
    end
  end
end
