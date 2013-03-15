class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_application_wide_varibales
  
  def load_application_wide_varibales   
   
    
    def show
        @post = Post.find(params[:id])
        respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @post }
      end
    end 
    
  def get_subcategory_and_post
   @sub_category = SubCategory.all
  end
end

  
class PostController < ActionController::Base
  before_filter :get_subcategory_and_post, only: [:show]

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
  end
end
  
  class SubCategoryController < ActionController::Base
    before_filter :get_subcategory_and_post
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
    helper_method :current_user
  end

end