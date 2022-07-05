Rails.application.routes.draw do
  #resources :words, only: [:index]
  get 'words/randomWord'
  get 'words/:word/definition',to: 'words#definition'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
