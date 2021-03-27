Rails.application.routes.draw do
  root 'posts#index'
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    post 'users/second_guest_sign_in', to: 'users/sessions#guest_user'
  end

  resources :posts do
    resources :comments, only: [:create]
  end
  
end
