Jog::Application.routes.draw do
  get   '/login', :to => 'sessions#new', :as => :login
  match '/auth/:provider/callback', :to => 'sessions#create'
  match '/auth/failure', :to => 'sessions#failure'

  root :to => 'posts#index'
  resources :posts do
    get :autocomplete_post_name, :on => :collection
  end
  resources :posts do
    collection do
        put :update_attribute_on_the_spot
        get :get_attribute_on_the_spot
    end
  end
end
