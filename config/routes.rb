Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'

  resources :elementos  
  resources :insumos 
  resources :medidas	
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
