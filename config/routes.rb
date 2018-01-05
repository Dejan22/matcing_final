Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :users
  resources :profiles, only: [:new, :edit, :create, :update]
  resources :students
  resources :matches

  put 'admin/:id' => 'users#toggle_admin', :as => "toggle_admin"

end
