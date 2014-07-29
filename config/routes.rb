Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'

  root 'sessions#index'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  get 'register', to: 'users#new'
  #post 'register', to: 'users#create'
  get 'home', to: 'videos#index'

  #get 'users', to: 'users#show' #this is just temporary, for the form helper

  resources :videos, only: [:index, :show] do
    collection do
      get 'search', to: 'videos#search'
    end
  end
  resources :categories, only: [:show]
  resources :users, only: [:create]
end
