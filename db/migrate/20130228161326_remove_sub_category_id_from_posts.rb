class RemoveSubCategoryIdFromPosts < ActiveRecord::Migration
  def self.up
    remove_column :posts, :sub_catgeory_id
  end
  
  def down
  end
end
