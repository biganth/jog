class SubCategoriesController < ApplicationController
  add_breadcrumb "home", :root_path
  def names
    names = []
    all = Post.find(:all, :conditions => ['name LIKE ? OR name LIKE ?', "#{params[:q]}%", "% #{params[:q]}"], :order => 'name')
    #all = Post.where("name LIKE ? OR name LIKE ?", "#{params[:q]}%", "% #{params[:q]}%")
    all.each { |post| names << post.name }

    render json: names
  end

  def index
    @sub_category = SubCategory.all
    @post = Post.new
  end

end
