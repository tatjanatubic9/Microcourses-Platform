Rails.application.routes.draw do

 

  
  get 'comments/show'

  get 'comments/index'

  get 'profiles/show'

  get 'answer_comments/new'

  get 'answer_comments/show'

  get 'answer_comments/index'
  
  get 'quizzes' => 'quiz#index', as: :my_quizzes
  
  get "courses/:id/vote/:vote", to: 'courses#vote'

  

  get 'my_courses' => 'courses#my_courses', as: :my_courses
  
  get 'courses/:course_id/quiz/:quiz_id/pending_quizzes/' => 'pending_quizzes#index', as: :pending_quizzes
  
  devise_for :users, :controllers => {registrations:'registrations'}
  
   resources :quiz_results, :except => [:edit, :update, :destroy]
   
   resources :courses do
      resources :lessons do
        resources :comments, :except => [:edit, :update]
      end  
      
      resources :quiz, :except => [:index,:edit, :update] do
          resources :questions, :except => [:show, :edit, :update]
          resources :pending_quizzes, :except => [:destroy, :edit ,:update]
      end
   end
   
   
  
  
  
  
  root 'welcome#homepage'

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
