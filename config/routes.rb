Rails.application.routes.draw do
 root 'blogs#index1'
  resources :blogs do
     collection do
        post :confirm 
     end
  end
end
