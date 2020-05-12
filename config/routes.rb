Rails.application.routes.draw do
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
  resources :users, except: :index do
    get 'users/:name', controller: 'users', action: 'edit'
    collection do
      get "step1user"
      post "step2user"
      get "complete_signup"
      get "complete_logout"
    end
  end
end
