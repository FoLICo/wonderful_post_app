Rails.application.routes.draw do
  get 'mypage', to: 'mypages#index'
  # resources :mypages
  devise_for :users
  # resources :users
  root to: 'articles#index'
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
