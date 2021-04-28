Rails.application.routes.draw do
  # devise_for :users
devise_for :users
root to: 'homes#top'
get "/home/about" => "homes#about"
resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
resources :homes, only: [:about, :top]
resources :users, only: [:show, :index, :edit, :update, :destroy]
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
