class SubCategoriesController < ApplicationController
  
  def list
    list = []
    names = Post.where("name LIKE ?", "%#{params[:term]}%").limit(10)
    names.each { |post| list << {"label" => post.name} }
    
    respond_to do |format|
      format.json { render :json => list.to_json, :layout => false }
    end
  end
  
  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @sub_category = SubCategory.all
  end

  def show
  end
end
