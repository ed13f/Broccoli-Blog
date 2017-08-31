class User < ApplicationRecord
  include BCrypt

  has_many :entries

  validates :email, :password, :username, presence: true
  validates :email, :username, uniqueness: true

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end
end
