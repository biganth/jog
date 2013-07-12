class Post < ActiveRecord::Base
  belongs_to :sub_category
  belongs_to :users
  validates :title, :content, :sub_category_id, :presence => true
  attr_accessible :content, :title, :sub_category_id
  after_save    :expire_post_all_cache, :enqueue_create_or_update_document_job
  after_destroy :expire_post_all_cache, :enqueue_delete_document_job
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  
  Post.order(:title)
  
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

    private

    def enqueue_create_or_update_document_job
      Delayed::Job.enqueue CreateOrUpdateSwiftypeDocumentJob.new(self.id)
    end

    def enqueue_delete_document_job
      Delayed::Job.enqueue DeleteSwiftypeDocumentJob.new(self.id)
    end
    
end
