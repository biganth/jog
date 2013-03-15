class SubCategoriesController < ApplicationController
  def names
    names = []
    all = Post.where("name like?", "#{params[:q]}%")
    all.each { |post| names << post.name }

    render json: names
  end

  def index
    @sub_category = SubCategory.all
  end

end
