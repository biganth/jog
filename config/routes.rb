Jog::Application.routes.draw do
  get "category/index"

  get "sub_categories/new"

  get "sub_categories/create"

  get "sub_categories/update"

  get "sub_categories/edit"

  get "sub_categories/destroy"

  get "sub_categories/index"

  get "sub_categories/show"

  devise_for :users
  
  match 'sub_categories/list' => 'sub_categories#list'

  get   '/login', :to => 'sessions#new', :as => :login
  match '/auth/:provider/callback', :to => 'sessions#create'
  match '/auth/failure', :to => 'sessions#failure'
  match 'signout', to: 'sessions#destroy', as: 'signout'

  root :to => 'sub_categories#index'

   resources :posts do
      collection do
        get :autocomplete
        put :update_attribute_on_the_spot
        get :get_attribute_on_the_spot
      end
    end
end

  

