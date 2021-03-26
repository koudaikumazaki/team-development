Rails.application.routes.draw do
  root 'posts#index'
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :posts do
    resources :comments
  
    
    devise_scope :user do
      get "sign_in", :to => "users/sessions#new"
      get "sign_out", :to => "users/sessions#destroy" 
      post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  
end
