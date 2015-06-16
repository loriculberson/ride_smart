class User < ActiveRecord::Base
  validates :username, :password, :email, presence: true
  validates :username, uniqueness: true
  validates :email, uniqueness: true
  
  has_secure_password

  def self.find_or_create_from_auth(auth)
    User.find_or_create_by(provider: auth.provider, uid: auth.uid).tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.name
      user.email = auth.info.email
      user.save!
    end
  end
end
