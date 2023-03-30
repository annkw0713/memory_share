Rails.application.routes.draw do
  devise_for :users
  root 'memories#index'
end
