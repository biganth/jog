class Post < ActiveRecord::Base
  belongs_to :sub_category
  has_many :users
  validates :name, :content, :sub_category_id, :presence => true
  attr_accessor :names
  attr_accessible :content, :names
  after_save    :expire_post_all_cache
  after_destroy :expire_post_all_cache
  
  def self.to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |post|
          csv << post.attributes.values_at(*column_names)
        end
      end
    end
  
  def self.all_cached
    Rails.cache.fetch('Post.all') { all }
  end

  def expire_post_all_cache
    Rails.cache.delete('Post.all')
  end
end
