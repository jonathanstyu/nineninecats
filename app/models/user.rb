require 'SecureRandom'

class User < ActiveRecord::Base
  attr_accessible :username, :password
  has_many :cats
  validates :username, :presence => true
  after_create :generate_token!

  def password= (password)
    self.password_hash = Digest::SHA2.base64digest(password)
  end

  def verify_password(password)
    self.password_hash == Digest::SHA2.base64digest(password)
  end

  def generate_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end


end
