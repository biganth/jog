Jog::Application.routes.draw do

  get "about", to: 'about#index'

  get "sub_categories/index"
  
  get "sub_categories/names"

  devise_for :users

  #get   '/login', :to => 'sessions#new', :as => :login
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

  

