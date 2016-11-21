Rails.application.routes.draw do
  root  'static_pages#home'
  get 'contact'   =>  'static_pages#contact'
  get 'signup'    =>  'users#new'
  get 'login'	    =>  'sessions#new'
  post 'login'	  =>  'sessions#create'
  delete 'logout' =>  'sessions#destroy'
  resources :users do
  	member do
  		get :following, :followers
  	end
  end
  resources :relationships, only: [:create, :destroy]
end
