Rails.application.routes.draw do
  devise_for :users

  get 'user_profiles/edit', to: 'user_profiles#edit', as: :edit_user_profile
  put 'user_profiles', to: 'user_profiles#update'
  patch 'user_profiles', to: 'user_profiles#update'
  resources :user_profiles, only: [:index, :new, :create, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index', as: :root
end
