class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_application_wide_varibales

  
  def load_application_wide_varibales
    @post = Post.new
  end
  
  def auto
    @auto = autocomplete :post, :name, :full => true, :extra_data => [:content]
  end
  
  def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
