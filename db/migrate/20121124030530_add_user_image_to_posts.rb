class AddUserImageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user_image, :string
  end
end
