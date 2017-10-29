class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  
  require 'digest/md5'

  def to_hex(str)
    Digest::MD5.hexdigest(str)
  end
      
  def render_404
	render file: "public/404.html", status: 404
  end

end
