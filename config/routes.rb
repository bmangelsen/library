Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', controller: :books, action: :welcome, as: :welcome
  get '/books', controller: :books, action: :index, as: :index
  get '/books/new', controller: :books, action: :new, as: :new
  post '/books', controller: :books, action: :create, as: :create
end
