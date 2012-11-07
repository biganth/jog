Jog::Application.routes.draw do
  match '/auth/:provider/callback' => 'authentications#create'
  devise_for :users
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
