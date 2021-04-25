Rails.application.routes.draw do
  # devise_for :users
devise_for :users
root to: 'homes#top'
resources :books, only: [:new, :create, :index, :show, :destroy]
resources :homes
resources :users, only: [:edit, :update]
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
