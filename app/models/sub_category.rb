class SubCategory < ActiveRecord::Base
  attr_accessible :name, :category_id
  belongs_to :category
  has_many :posts, dependent: :destroy
  validates :name, :category_id, :presence => true
end
