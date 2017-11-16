  Rails.application.routes.draw do
  devise_for :usuarios
  get 'welcome/index'

  root 'welcome#index'
  resources :usuarios
  
  resources :insumos 
  resources :medidas	
  resources :listas
  resources :clientes
  resources :productos do
  	resources :hojas
  end

  get 'pedidos/pendientes', to: 'pedidos#pendientes', as: 'pendientes'
  get 'pedidos/espera', to: 'pedidos#espera', as: 'espera'
  get 'pedidos/entregados', to: 'pedidos#entregados', as: 'entregados'
  post "pedidos/:id" => "pedidos#edit"
  get 'pedidos/listas/:id', to: 'listas#show', as: 'Ver_pedido'
  resources :pedidos do
  	resources :items
  end
  get 'elementos/listar/:id', to: 'elementos#listar'
  resources :elementos  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
