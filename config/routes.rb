Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

   get 'favorites/blogs/:id'=> 'users#favorites_list'
  
 root 'blogs#index1'
  resources :blogs do
     collection do
        post :confirm 
     end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:create, :destroy]
end
