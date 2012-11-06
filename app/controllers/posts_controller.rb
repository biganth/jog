class PostsController < ApplicationController
  caches_action :index, :show
  autocomplete :post, :name
  can_edit_on_the_spot
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all_cached
    @stats = Rails.cache.stats.first.last
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to '/', notice: 'Post was successfully created.' }
        format.js   { redirect_to '/', notice: 'Post was successfully created.' }
      else
        format.html { render action: "new" }
        format.js { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to '/', notice: 'Post was successfully updated.' }
        format.js
      else
        format.html { render action: "edit" }
        format.js { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to '/' }
      format.js
    end
  end
end
