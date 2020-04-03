Rails.application.routes.draw do
  # get '/favorite/:icecream/color/:color_name', to: "items#testing"
  # get 'items/create'
  resources :items 

 resources :user
# resources :list_items

  delete '/remove_item/:list_id/:item_id', to: "list_items#destroy", as: "remove_item"
 
  
  
 resources :lists do
  resources :items, only: [:new, :create, :index, :show]
 end
     
 

  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' } 
    
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: "home#index"
end
