Rails.application.routes.draw do
  devise_for :usuarios
  get 'welcome/index'

  root 'welcome#index'
  resources :usuarios
  resources :elementos  
  resources :insumos 
  resources :medidas	
  resources :listas
  resources :productos do
  	resources :hojas
  end

  resources :pedidos do
  	resources :items
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
