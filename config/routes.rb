Rails.application.routes.draw do


  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get 'homes/top'
  root to: "home#top"
  get "/home/about" => "home#about"


  # bookページ
  resources :books, only: [:create, :index, :show, :edit, :destroy, :update]
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  # get 'books/edit'

  # usersページ
  resources :users, only: [:create, :new, :index, :show, :edit, :update]
  # get 'users/new'
  # get 'users/index'
  # get 'users/show'
  # get 'users/edit'
end
