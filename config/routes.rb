Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions" }

  get 'samples/new_html' => 'samples#new_html'
  get 'boards/lookup' => 'boards#lookup'

  resources :samples

  resources :boards

  root 'boards#show'

  get 'kanye' => 'boards#show'

  get  "dropbox/main" => "dropbox#main"
  post "dropbox/upload" => "dropbox#upload"
  get  "dropbox/auth_start" => "dropbox#auth_start"
  get  "dropbox/auth_finish" => "dropbox#auth_finish"
  get  "dropbox/redirect_to_main" => "dropbox#redirect_to_main"

  get "dropbox/has_token" => "dropbox#has_token?"

  get "dropbox/forward_to_root"

  devise_scope :user do
    post "users/save_token" => 'users/sessions#save_token'
    get "users/save_token" => 'users/sessions#save_token'
    get "users/lookup" => 'users/sessions#lookup'
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
