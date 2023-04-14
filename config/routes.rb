Rails.application.routes.draw do
  devise_for :users
  root 'memories#index'
  resources :memories do
    resources :comments, only: [:create, :destroy]
  end
  resources :my_memories, only: [:index]
  resources :users do
    resource :relationships, only: [:show, :create, :destroy]
    get 'followings', to: 'relationships#followings', as: 'followings'
    get 'followers', to: 'relationships#followers', as: 'followers'
  end
end
