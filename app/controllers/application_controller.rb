class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_application_wide_varibales

  private

  def load_application_wide_varibales
    @post = Post.new
  end
end
