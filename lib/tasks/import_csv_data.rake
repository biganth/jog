namespace :csvimport do
require 'csv'
task :import_csv_data => :environment do

  @file = "db/posts.csv"

  CSV.foreach(@file, :encoding => "utf-8", :headers => true) do |row|
      P = Post.create!({
      :name => row[1],
      :content => row[2],
      :created_at => row[3],
      :updated_at => row[4],
      :user_id => row[5],
    }
   )
    P.save!
  end
 end
end