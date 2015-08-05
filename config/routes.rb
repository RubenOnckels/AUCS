Rails.application.routes.draw do
  
  resources :posts
  
  root 'static#index'
  
  get '/about' => 'static#about'
  get '/events' => 'static#events'
  get '/contact' => 'static#contact'
  get '/blog' => 'posts#index'
  get '/admin' => 'posts#admin'
  
  post '/find' => 'posts#find'
  post '/posts/more' => 'posts#more', :as => :posts_more
  
  
end
