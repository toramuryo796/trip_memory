Rails.application.routes.draw do
  get 'plans/create'
  get 'candidates/new'
  devise_for :users
  root "groups#index"
  resources :schedules,    only: [:index, :create, :update, :delete]

  resources :groups,       only: [:index, :new, :create, :show, :destroy] do
    resources :candidates, only: [:index, :new, :create, :edit, :update, :destroy ] do
      resources :goods,    only: [:create,:destroy]
    end
    resources :plans,      only: [:index, :new, :create, :edit, :update, :destroy ]
  end
end
