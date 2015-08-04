class User < ActiveRecord::Base
  has_secure_password

  validates :user, :email, :password_digest, presence:true
  validates :user, :email, uniqueness: true
  validates :password_digest, length: { minimum: 5, maximum: 20 }

  has_many :posts
end
