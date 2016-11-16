Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books do
    resources :reservations
  end
  root 'books#welcome'

  get '/reservations', controller: :reservations, action: :all
end


# get '/', controller: :books, action: :welcome, as: :welcome
# get '/books/new', controller: :books, action: :new, as: :new
# get '/books/:id/edit', controller: :books, action: :edit, as: :edit
#
# get '/books', controller: :books, action: :index, as: :index
# post '/books', controller: :books, action: :create
#
# get '/books/:id', controller: :books, action: :view, as: :book
# patch '/books/:id', controller: :books, action: :patch
# delete '/books/:id', controller: :books, action: :delete
