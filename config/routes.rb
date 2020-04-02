Rails.application.routes.draw do
  # get '/favorite/:icecream/color/:color_name', to: "items#testing"
  # get 'items/create'
  resources :items 

 resources :user do 
  resources :list_items
  
 end
  
  
 resources :lists do
  resources :items, only: [:new, :create, :index, :show]
 end
     
 

  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' } 
    
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: "home#index"
end
