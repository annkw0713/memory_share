Rails.application.routes.draw do
  devise_for :users
  root 'memories#index'
  resources :memories do
    resources :comments, only: [:create, :destroy]
  end
  resources :my_memories, only: [:index]
end
