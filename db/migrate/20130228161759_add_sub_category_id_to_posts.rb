class AddSubCategoryIdToPosts < ActiveRecord::Migration
  def change
      add_column :posts, :sub_catgeory_id, :integer
  end
end
