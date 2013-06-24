Torti::Application.routes.draw do

  get "set_language/english"

  get "set_language/german"

  scope "(:locale)", :locale => /en|de/ do
    root :to => 'login#login'
    get "login/login"
  end

    scope "(:locale)", :locale => /en|de/ do
    root :to => 'login#default'
    get "login/default"
  end

  get "login/login"
  post "login/login"
  get "login/logout"
  post "login/logout"
  get "login/default"

  resources :answers


  resources :statistics, :only => [:index]

  resources :students #, :only => [:new, :create, :index]

  #get 'students/:id/show_validation_link' => 'students#show_validation_link' , :as => "validation_link"

  get 'students/:id/validate' => 'students#validate' , :as => "validate"

  #scope :module => "students_path" do
  #  resources :register_student
  #end


  resources :registerd_users


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
