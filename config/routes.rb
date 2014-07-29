Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'

  root 'sessions#index'
  get 'sign_in', to: 'pages#front'
  post 'sign_in', to: 'sessions#create'
  get 'register', to: 'users#new'
  get 'home', to: 'videos#index'

  resources :videos, only: [:index, :show] do
    collection do
      get 'search', to: 'videos#search'
    end
  end
  resources :categories, only: [:show]
  resources :users, only: [:create]
end
