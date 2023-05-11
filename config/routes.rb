Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/readers", to: "readers#index"
  get "/readers/:id", to: "readers#show"

  get "/books", to: "books#index"
  get "/books/:id", to: "books#show"

  get "/readers/:reader_id/books", to: "reader_books#index"
end
