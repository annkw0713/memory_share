Rails.application.routes.draw do
  devise_for :users
  root 'memories#index'
  resources :memories
  resources :my_memories, only: [:index]
end
