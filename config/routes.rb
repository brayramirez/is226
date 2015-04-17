Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users, :controllers => {
    :confirmations => 'users/confirmations',
    :passwords => 'users/passwords',
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'}

  devise_scope :user do
    put "/users/confirmation" => "users/confirmations#update"
  end


  get '/', :to => 'home#new', :as => :new_account
  post '/', :to => 'home#create', :as => :create_account

  get '/restricted', :to => 'restricted#show'


  namespace :admin do
    resources :categories
    resource :my_account, :only => [:show, :edit, :update]
    resource :password, :only => [:edit, :update]

    resources :admins do
      member do
        put 'enable'
        put 'reset_password'
        put 'resend_confirmation'
      end
    end

    resources :buyers do
      member do
        put 'enable'
        put 'reset_password'
        put 'resend_confirmation'
      end
    end

    resources :bidders do
      member do
        put 'enable'
        put 'reset_password'
        put 'resend_confirmation'
      end
    end


    # resources :users, :only => [:show, :edit, :update, :destroy] do
    #   member do
    #     put 'enable'
    #     put 'reset_password'
    #   end
    # end

    root 'categories#index'
  end


  namespace :buyer do
    resource :my_account, :only => [:show, :edit, :update]
    resource :password, :only => [:edit, :update]
    resources :dashboard, :only => [:index]
    resources :orders,
      :only => [:index, :show, :new, :create, :edit, :update] do

      member do
        put 'close'
      end
    end

    resources :bids, :only => [:show] do
      resources :comments, :only => [:create]

      member do
        put 'award'
      end
    end

    root 'dashboard#index'
  end


  namespace :bidder do
    resource :my_account, :only => [:show, :edit, :update]
    resource :password, :only => [:edit, :update]
    resources :dashboard, :only => [:index]
    resources :orders, :only => [:index, :show] do
      resources :bids, :only => [:new, :create]
    end

    resources :bids, :only => [:show, :edit, :update] do
      resources :comments, :only => [:create]

      member do
        put 'withdraw'
        put 'reopen'
      end
    end

    root 'dashboard#index'
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
  #     collection dohttp://localhost:3000/users/confirmation/new
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

  root 'home#new'

end
