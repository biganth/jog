class User < ActiveRecord::Base
  has_many :posts
  attr_accessible :name, :image, :email, :user_id
  
  def self.from_omniauth(auth)
      where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end
    
  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
      user.email = auth["info"]["email"]
      user.image = auth["info"]["image"]
    end
  end
end
