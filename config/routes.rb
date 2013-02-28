Jog::Application.routes.draw do
  devise_for :users

  get   '/login', :to => 'sessions#new', :as => :login
  match '/auth/:provider/callback', :to => 'sessions#create'
  match '/auth/failure', :to => 'sessions#failure'
  match 'signout', to: 'sessions#destroy', as: 'signout'

  root :to => 'posts#index'

  resources :posts do
    collection do
      get :autocomplete_name
      put :update_attribute_on_the_spot
      get :get_attribute_on_the_spot
    end
  end
end

  

