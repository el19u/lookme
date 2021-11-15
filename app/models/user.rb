require "digest"

class User < ApplicationRecord
  validates :username, :password, presence: true 
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/}

  before_create :encypt_password

  private
  def encypt_password
    self.password = Digest::SHA1.hexdigest(self.password)
  end
end
