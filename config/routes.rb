Rails.application.routes.draw do
  resources :posts

  # localhost:3000/articles
  get '/articles' => 'articles#index'
  # root 'articles#index'

  # localhost:3000/articles/new
  get '/articles/new' => 'articles#new', as: 'new_article'
  post '/articles' => 'articles#create', as: 'create_article' 

  # localhost:3000/articles/id
  get '/articles/:id' => 'articles#show', as: 'show_article'

  # edit
  patch '/articles/:id' => 'articles#update', as: 'update_article'

  # delete
  delete '/articles/:id' => 'articles#delete', as: 'delete_article'
end
