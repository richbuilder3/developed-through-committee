Dtc::Application.routes.draw do


  root :to => "home#index"

  get "about" => "pages#about"

  devise_for :users, :controllers => {:registrations => "users/registrations", :passwords => "users/passwords"}

  resources :users

  resources :employers

  resources :developers 

  resources :projects

  match '/send_mail', to: 'contact#send_mail', via: 'post'

  match '/contacts',     to: 'contacts#new',             via: 'get'
  resources "contacts", only: [:new, :create]


end

#  Prefix Verb   URI Pattern                    Controller#Action
#                     root GET    /                              home#index
#         new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
#             user_session POST   /users/sign_in(.:format)       devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
#            user_password POST   /users/password(.:format)      devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#                          PATCH  /users/password(.:format)      devise/passwords#update
#                          PUT    /users/password(.:format)      devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
#        user_registration POST   /users(.:format)               devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
#                          PATCH  /users(.:format)               devise/registrations#update
#                          PUT    /users(.:format)               devise/registrations#update
#                          DELETE /users(.:format)               devise/registrations#destroy
#                    users GET    /users(.:format)               users#index
#                          POST   /users(.:format)               users#create
#                 new_user GET    /users/new(.:format)           users#new
#                edit_user GET    /users/:id/edit(.:format)      users#edit
#                     user GET    /users/:id(.:format)           users#show
#                          PATCH  /users/:id(.:format)           users#update
#                          PUT    /users/:id(.:format)           users#update
#                          DELETE /users/:id(.:format)           users#destroy
#                employers GET    /employers(.:format)           employers#index
#                          POST   /employers(.:format)           employers#create
#             new_employer GET    /employers/new(.:format)       employers#new
#            edit_employer GET    /employers/:id/edit(.:format)  employers#edit
#                 employer GET    /employers/:id(.:format)       employers#show
#                          PATCH  /employers/:id(.:format)       employers#update
#                          PUT    /employers/:id(.:format)       employers#update
#                          DELETE /employers/:id(.:format)       employers#destroy
#               developers GET    /developers(.:format)          developers#index
#                          POST   /developers(.:format)          developers#create
#            new_developer GET    /developers/new(.:format)      developers#new
#           edit_developer GET    /developers/:id/edit(.:format) developers#edit
#                developer GET    /developers/:id(.:format)      developers#show
#                          PATCH  /developers/:id(.:format)      developers#update
#                          PUT    /developers/:id(.:format)      developers#update
#                          DELETE /developers/:id(.:format)      developers#destroy
#                 projects GET    /projects(.:format)            projects#index
#                          POST   /projects(.:format)            projects#create
#              new_project GET    /projects/new(.:format)        projects#new
#             edit_project GET    /projects/:id/edit(.:format)   projects#edit
#                  project GET    /projects/:id(.:format)        projects#show
#                          PATCH  /projects/:id(.:format)        projects#update
#                          PUT    /projects/:id(.:format)        projects#update
#                          DELETE /projects/:id(.:format)        projects#destroy





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

