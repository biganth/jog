class ChangeColumn < ActiveRecord::Migration
  def up
    change_column :posts, :content, :text
  end

  def down
    ActiveRecord::IrreversibleMigration
  end
end
