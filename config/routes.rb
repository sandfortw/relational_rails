# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/authors', to: 'authors#index'
  get '/authors/new', to: 'authors#new'
  post '/authors', to: 'authors#create'
  get '/authors/:id', to: 'authors#show'
  patch '/authors/:id', to: 'authors#update'
  get '/authors/:id/edit', to: 'authors#edit'
  delete '/authors/:id', to: 'authors#destroy'

  get '/books', to: 'books#index'
  post '/books', to: 'books#create'
  get '/books/:id', to: 'books#show'
  patch '/books/:id', to: 'books#update'
  get '/books/:id/edit', to: 'books#edit'
  delete '/books/:id', to: 'books#destroy'

  get '/authors/:id/books', to: 'author_books#index'
  get '/authors/:id/books/new', to: 'author_books#new'
  post '/authors/:id/books', to: 'author_books#create'
end
