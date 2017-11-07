Rails.application.routes.draw do
  devise_for :users

  resources :user_profiles do
    member do
      get :properties
      get :add_contact
    end
    get :contacts, on: :collection
  end

  resources :properties


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index', as: :root
end
