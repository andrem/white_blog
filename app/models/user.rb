class User < ActiveRecord::Base
  attr_reader :password

  def password=(pw)
    @password = pw 

	salt = [Array.new(6){rand(256).chr}.join].pack("m").chomp 
    password_salt, password_hash = salt, Digest::MD5.hexdigest(pw + salt)
  end

  def password_is?(pw)
    Digest::MD5.hexdigest(pw + password_salt) == password_hash
  end
end
