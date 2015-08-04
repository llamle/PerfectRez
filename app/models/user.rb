class User < ActiveRecord::Base
  attr_accessor :first_name, :last_name, :email

  has_secure_password

  before_save { self.email = email.downcase }

  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 20 }
  validates :username, presence: true, uniqueness: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 5, maximum: 20 }, allow_nil: true
  validates :password_digest, presence: true

  after_validation { self.errors.messages.delete(:password_digest) }

  has_many :posts

end
