Workflow::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions"}
  devise_for :users do
    get '/users/sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    get '/users/sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
    get "/users/sign_up", :to => "registrations#new"
  end

  authenticated :user do
    root :to => "users#index"
  end

  unauthenticated :user do
    devise_scope :user do
      get "/" => "sessions#new"
    end
  end

  resources :users do
    collection do
      get 'show_db_settings'
      post 'save_db_settings'
      get 'list_users'
    end
    member do
      get 'edit_user'
      put 'update_user'
    end
  end

  resources :roles do
    member do
      get 'show_permissions'
      post 'set_permissions'
    end
  end

  resources :flows
  resources :nodes do
    collection do
      post 'filter_nodes'
      post 'filter_decision_value'
    end
    member do
      post 'filter_nodes'
    end
  end

  resources :node_pages do
    collection do
      get 'new_data_entry'
      get 'new_decision'
      get 'new_information'
      post 'save_data_entry'
      post 'save_decision'      
      get 'new_task'
      get 'list_task'
      post 'save_task'
    end
  end
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

end
