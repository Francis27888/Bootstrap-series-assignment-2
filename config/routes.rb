Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

 root 'blogs#index1'
  resources :blogs do
     collection do
        post :confirm 
     end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users

end
