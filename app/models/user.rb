class User < ActiveRecord::Base
  validates :username, :email, presence: true
  validates :username, uniqueness: true
  validates :email, uniqueness: true
  
  has_secure_password

  def self.find_or_create_from_auth(auth)
    User.find_or_create_by(provider: auth.provider, uid: auth.uid).tap do |user|
      user.provider   = auth.provider
      user.uid        = auth.uid
      user.username   = auth.info.name
      user.email      = auth.info.email
      user.image_url  = auth.info.image
      user.token      = auth.credentials.token
      user.password   = "password"
       
      user.save
    end
  end
end
