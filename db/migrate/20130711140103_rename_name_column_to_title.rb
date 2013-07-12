class RenameNameColumnToTitle < ActiveRecord::Migration
  change_table :posts do |t|
    t.rename :name, :title
  end
end
