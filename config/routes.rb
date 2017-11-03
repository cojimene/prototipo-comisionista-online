Rails.application.routes.draw do
  devise_for :users

  resources :user_profiles, only: [:index, :new, :create]
  get 'user_profiles/profile', to: 'user_profiles#show', as: :user_profile
  get 'user_profiles/edit', to: 'user_profiles#edit', as: :edit_user_profile
  put 'user_profiles', to: 'user_profiles#update'
  patch 'user_profiles', to: 'user_profiles#update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index', as: :root
end
