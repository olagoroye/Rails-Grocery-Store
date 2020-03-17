Rails.application.routes.draw do
 
  resources :list_items
  resources :lists
  resources :items
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: "home#index"
end
