require 'bcrypt'

class User < ActiveRecord::Base
has_many :questions
has_many :answers
has_many :comments

include BCrypt
 def password
   @password ||= Password.new(hashed_password)
 end

 def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
 end

def self.authenticate(email, password)
    @user = User.find_by(email: email)
    if @user && @user.password == password
      @user
    else
      nil
    end
  end

end
