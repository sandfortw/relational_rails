Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/authors', to: 'authors#index'
  get '/authors/new', to: 'authors#new'
  post '/authors', to: 'authors#create'
  get '/books', to: 'books#index'
  get '/books/new', to: 'books#new'
  post '/books', to: 'books#create'

  
end
