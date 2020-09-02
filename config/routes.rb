Rails.application.routes.draw do
  get 'plans/create'
  get 'candidates/new'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "groups#index"
  resources :groups,       only: [:index, :new, :create, :show, :destroy] 
  resources :candidates, only: [:index, :new, :create, :edit, :update, :destroy ]
  resources :plans,      only: [:index, :new, :create, :edit, :update, :destroy ]
  resources :goods,      only: :create
end
