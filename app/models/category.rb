class Category < ActiveRecord::Base
  attr_accessible :name, :sub_category_id
  has_many :sub_categories
  has_many :posts, :through => :sub_categories
end
