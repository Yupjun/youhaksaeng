Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  resources :users do
    member do
      get :confirm_email
    end
  end
  get 'searches' => 'search#index'
  
  resources :sessions, only: [:new, :create, :destroy]

  root 'posts#index'
  resources :posts do
    resources :comments, shallow: true
    collection do
      get 'search_index' #포스트 내의 새로운 액션 경로
    end
  end 

  
 
  #<공지사항 크롤링>
  get 'notices/index'
  get 'notices/page_cleaner'
  #</공지사항 크롤링>
  
  # 맵 제작에 필요하니까 maps/index 지우지마세요~
  resources :maps, only: [:new]
  get 'maps/index'
  post 'maps' => 'maps#index'

  #Email-validation
  



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
