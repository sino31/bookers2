Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :users
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  get 'home/about' => 'homes#about' ,as: 'about'
  resources :books, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]  
    resources :book_comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
