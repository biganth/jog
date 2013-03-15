class SubCategoriesController < ApplicationController
  def names
    names = []
    all = Post.where("name LIKE ? OR name LIKE ?", "#{params[:q]}%", "% #{params[:q]}%")
    all.each { |post| names << post.name }

    render json: names
  end

  def index
    @sub_category = SubCategory.all
  end

end
