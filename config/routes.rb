Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "arti÷cles#index"
  
  get "/readers", to: "readers#index"
  get "/readers/new", to: "readers#new"
  post "/readers", to: "readers#create"
  get "readers/:id/edit", to: "readers#edit"
  get "/readers/:id", to: "readers#show"

  get "/books", to: "books#index"
  get "/books/:id", to: "books#show"

  get "/readers/:reader_id/books", to: "reader_books#index"
end
