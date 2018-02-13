Blogger::Application.routes.draw do
  
  # works too : root to: 'articles#index'
  root :to => "articles#index"

  resources :articles do
  	resources :comments
  end

  resources :tags

end
