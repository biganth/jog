Jog::Application.routes.draw do
  root :to => 'posts#index'
  resources :posts do
    collection do
        put :update_attribute_on_the_spot
        get :get_attribute_on_the_spot
    end
  end
end
