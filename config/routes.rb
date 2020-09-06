Rails.application.routes.draw do
  devise_for :users
  root "groups#index"
  resources :schedules,     only: [:index, :new, :create, :update, :destroy, :edit]
  resources :day_hows,      only: [:index, :new, :create, :show, :update, :destroy]

  resources :groups,       only: [:index, :new, :create, :show, :destroy] do
    resources :candidates, only: [:index, :new, :create, :edit, :update, :destroy ] do
      resources :goods,    only: [:create,:destroy]
    end
    resources :plans do
      resources :dictionaries, only: [:index, :create, :update, :edit, :destroy ]
    end
  end
end
