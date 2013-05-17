class User < ActiveRecord::Base
  has_many :posts
  validates :email, :presence => true

  validates :password_hash, :presence => true
  validate :valid_email
  validate :valid_password

  


  include BCrypt

  def valid_email
    self.email =~ /\w+@\w+.\w{2,}/
  end

  def valid_password
    self.password_hash.length > 6
  end

  def password
    @password ||= Password.new(password_hash)
  end
  
  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
