class SubCategory < ActiveRecord::Base
  attr_accessible :name, :category_id
  belongs_to :category
  has_many :posts
  validates :name, :category_id, :presence => true
end
