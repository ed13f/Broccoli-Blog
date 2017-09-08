class User < ApplicationRecord
  validates :email, {presence: true }
  has_secure_password
  has_many :entries
  # def password
  #   @password ||= Password.new(hashed_password)
  # end

  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.hashed_password = @password
  # end

  # def self.authenticate(email, password)
  #   user = User.find_by(email: email)
  #   if user && user.password == password
  #     return user
  #   else
  #     return nil
  #   end
  # end
end
