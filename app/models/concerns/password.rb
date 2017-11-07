
module Password 

  def password_to_md5
  	self.password = Digest::MD5.hexdigest(self.password) if new_record?
  end

  def check_password?(pass)
  	self.password == Digest::MD5.hexdigest(pass)
  end

  def update_password(pass)
  	update password: Digest::MD5.hexdigest(pass)
  end

end