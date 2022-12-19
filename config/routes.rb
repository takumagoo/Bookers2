Rails.application.routes.draw do
  

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # get 'homes/top'
  root to: "homes#top"
  
  # bookページ
  resources :books, only: [:index, :show]
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  # get 'books/edit'
  
  # usersページ
  resources :users, only: [:new, :index, :show, :edit]
  # get 'users/new'
  # get 'users/index'
  # get 'users/show'
  # get 'users/edit'
end
