class CreateOrUpdateSwiftypeDocumentJob < Struct.new(:post_id)
  def perform
    post = Post.find(post_id)
    url = Rails.application.routes.url_helpers.post_url(post, :host => "jog.io")
    client = Swiftype::Easy.new
    client.create_or_update_document(ENV['SWIFTYPE_ENGINE_SLUG'],
                                     Post.model_name.downcase,
                                     {:external_id => post.id,
                                       :fields => [{:name => 'title', :value => post.title.downcase, :type => 'string'},
                                                   {:name => 'content', :value => post.content, :type => 'text'},
                                                   {:name => 'url', :value => url, :type => 'enum'},
                                                   {:name => 'created_at', :value => post.created_at.iso8601, :type => 'date'}]})
  end
end