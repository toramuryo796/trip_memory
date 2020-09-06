Rails.application.routes.draw do
  devise_for :users 
  
  root "users#show"
  resources :schedules,     only: [:index, :new, :create, :update, :destroy, :edit]
  resources :day_hows,      only: [:index, :new, :create, :show, :update, :destroy]
  
  resources :groups,       only: [:index, :new, :create, :show, :destroy] do
    resources :candidates do
      resources :goods,    only: [:create,:destroy]
    end
    resources :plans do
      resources :dictionaries, only: [:index, :create, :update, :edit, :destroy ]
    end
  end
  
  resources :users, only: :show do
    member do 
      get 'candidates'
    end
    member do 
      get 'plans'
    end
  end
end
