Rails.application.routes.draw do

 

  
  get 'pending_quiz/show'

  get 'pending_quiz/new'

  get 'pending_quiz/index'

  get 'show/new'

  get 'show/index'

  get 'my_courses' => 'courses#my_courses', as: :my_courses
  
  get 'courses/:course_id/quiz/:quiz_id/pending_quizzes/' => 'pending_quizzes#index', as: :pending_quizzes
  
  devise_for :users, :controllers => {registrations:'registrations'}
  
  
  
   resources :courses do
      resources :lessons
      resources :quiz do
          resources :questions
          resources :pending_quizzes do
            resources :quiz_answers
          end
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
