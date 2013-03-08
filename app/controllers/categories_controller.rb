class CategoriesController < ApplicationController
  def index
    @category = Category.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
  end
end

def new
   @category = Category.new
   respond_to do |format|
     format.html
     format.js
   end
 end

def create
  @category = Category.new(params[:category])

  respond_to do |format|
    if @category.save
      format.html { redirect_to '/', notice: 'Post was successfully created.' }
      format.js   { redirect_to '/', notice: 'Post was successfully created.' }
    else
      format.html { render action: "new" }
      format.js { render json: @category.errors, status: :unprocessable_entity }
    end
  end
end

end
