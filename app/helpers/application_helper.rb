module ApplicationHelper
  def get_posts_name
    Post.uniq.pluck(:name)
  end
end
