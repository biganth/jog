class RenameSubCategoryinPosts < ActiveRecord::Migration
  def change
    rename_column :posts, :sub_catgeory_id, :sub_category_id
  end
end
