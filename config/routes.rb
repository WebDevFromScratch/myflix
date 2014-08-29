Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'

  root 'pages#front'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy' #delete?
  get 'register', to: 'users#new'
  get 'home', to: 'videos#index'
  get 'my_queue', to: 'queues#index'

  resources :videos, only: [:index, :show] do
    collection do
      get 'search', to: 'videos#search'
    end

    resources :reviews, only: [:create]
  end
  resources :categories, only: [:show]
  resources :users, only: [:create]
end
