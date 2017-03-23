Rails.application.routes.draw do

  root 'home#index'

  get "/dashboard-json-data" => "home#export_dashboard_json_data"

  get "/dashboard-csv-data" => "home#export_dashboard_csv_data"

  get "/all-json-data" => "home#export_all_json_data"

  get "/all-csv-data" => "home#export_all_csv_data"

  get "/bak-incident-data" => "home#export_incidents"

  get "/bak-people-data" => "home#export_people"

  get "/bak-user-data" => "home#export_users"

  # get "/incidents/statistics" => "incidents#statistics"

  get "/incidents/data" => "incidents#data"

  get "/incidents/transcribe" => "incidents#transcribe"

  get "/incidents/new" => "incidents#new"

  get "/incidents/verify" => "incidents#verify"

  get "/incidents/classify-response" => "incidents#classify_response"

  get "/incidents/moving-cars" => "incidents#moving_cars"

  get "/incidents/fix-times" => "incidents#fix_times"

  get "/statistics" => "home#statistics"

  get "/statistics/#all" => "home#statistics"

  get "/statistics/#original" => "home#statistics"

  get "/statistics/#san-bernardino" => "home#statistics"

  get "/people/data/all" => "people#data_verified"

  get "/people/data/original" => "people#data_original"

  get "/people/data/san-bernardino" => "people#data_sb"

  resources :incidents, :only => [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :people, :only => [:index, :show, :new, :create, :edit, :update, :destroy]

  # resources :transcriptions, :only => [:index]

  devise_for :users

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
