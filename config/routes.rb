Rails.application.routes.draw do
    devise_for :users
    root to: "homes#top"
    get  'home/about', to: 'homes#about'
    resources :books, only: [:index, :create, :destroy, :update, :edit, :show]
    resources :users, only: [:index,:show, :edit,:update]
#   get '/users/:id'=>'users#show'
#   get '/users/show'=>'users#index'

#   get '/users/:id/edit'=>'users#edit'

#  詳細画面
#   get 'books/:id'=>'books#show'
#   get 'books/:id/edit'=>'books#edit'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
