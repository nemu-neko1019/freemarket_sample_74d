Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    member do
      get "buy"
    end
  end 
  resources :users, except: :index
    get 'users/:buy_product', controller: 'users',action: 'edit'
end
