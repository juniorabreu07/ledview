Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  devise_for :usuarios, path: "", path_names: {sign_in: 'inicio', sign_out: 'salida', password: 'secret', confirmation: 'verification', unlock: 'unblock'}
  
  #get 'inicio/index'

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  match "/pantallas", to: "inicio#pantalla", via: [:get,:post]
  scope :pantallas do 
    match "*path", to: "inicio#pantalla", via: [:get,:post]
    match "/*path", to: "inicio#pantalla", via: [:get,:post]
  end
  
  
  scope :api do 
    resources :usuarios
    resources :pantallas
    resources :provincias
    resources :anuncios
    resources :roles
  end
 
  # match 'anuncios/*path', to: 'permiso#index', via: [:get]
  # match 'anuncios', to: 'permiso#index', via: [:get]
  # match '*path', to: 'inicio#index', via: [:get, :post]
  # match '/*path', to: 'inicio#index', via: [:get, :post]

  authenticated :usuario do
    scope "/admin" do
      root to: "inicio#admin", as: :admin
    end
  end

  root to: 'inicio#index'
  match '*path', to: 'inicio#index', via: [:get, :post]
  match '/*path', to: 'inicio#index', via: [:get, :post]

  # match '*path', to: 'inicio#index', via: [:get, :post]
  # match '/*path', to: 'inicio#index', via: [:get, :post]
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
