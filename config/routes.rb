Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get '/books', to: 'books#fetch_all'
      get '/books/:id', to: 'books#single_book'
      post '/books', to: 'books#create'
      delete '/books/:id', to: 'books#delete'
    end
  end
end
