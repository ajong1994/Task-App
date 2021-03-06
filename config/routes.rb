Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/articles' => 'articles#index'
  # get '/articles/new' => 'articles#new', as: 'new_article'
  # post '/articles' => 'articles#create', as: 'create_article'
  # get '/articles/:id/edit' => 'articles#edit', as: 'edit_article'
  # patch '/articles/:id/edit' => 'articles#update', as: 'update_article'
  # delete '/articles/:id/delete' => 'articles#delete', as: 'delete_article'
  root to: "categories#index"

  resources :articles do
    resources :comments
  end

  resources :categories do
    resources :tasks
  end
end
