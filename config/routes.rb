Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update] # ユーザーマイページへのルーティング
  resources :foods
  root 'foods#index'
  resources :posts do
    member do
      patch 'rate'
    end
  end
end
