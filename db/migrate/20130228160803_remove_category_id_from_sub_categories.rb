class RemoveCategoryIdFromSubCategories < ActiveRecord::Migration
  def self.up
    remove_column :sub_categories, :category_id
  end

  def down
  end
end
