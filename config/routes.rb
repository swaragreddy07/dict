Rails.application.routes.draw do
  #resources :words, only: [:index]
  root 'users#home'
  get 'words/randomWord'
  get 'words/:word/definitions',to: 'words#definitions'
  get 'words/:word/examples', to: 'words#examples'
  get 'words/:word/relatedWords', to: 'words#relatedwords'
  get 'users/signup'
  get '/form', to: 'users#register', as: 'register'
  get '/login', to: 'users#user_validation', as: 'user_validation'
  get '/pick', to: 'users#plan',as: 'plan'
  get 'users/login'
  get 'users/home'
  get 'users/index'
  get 'users/logout'
  get 'users/addkey'
  get 'delete/:id', to: 'users#deletekey', as: 'deletekey'
  get 'users/pickplan'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
