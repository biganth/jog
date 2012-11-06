class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :name
  after_save    :expire_post_all_cache
  after_destroy :expire_post_all_cache
  
  def self.all_cached
    Rails.cache.fetch('Post.all') { all }
  end

  def expire_post_all_cache
    Rails.cache.delete('Post.all')
  end
end
