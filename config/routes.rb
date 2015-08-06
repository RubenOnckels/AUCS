Rails.application.routes.draw do
  
  resources :posts
  resources :events
  
  root 'static#index'
  
  get '/about' => 'static#about'
  get '/contact' => 'static#contact'
  get '/blog' => 'posts#index'
  get '/admin' => 'posts#admin'
  get '/blog/list' => 'posts#list'
  get '/event/list' => 'events#list'
  
  post '/find' => 'posts#find'
  post '/findE' => 'events#find'
  post '/posts/more' => 'posts#more', :as => :posts_more
  
  
end
