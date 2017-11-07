class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  
  
      
  def render_404
	  render file: "public/404.html", status: 404
  end

  def authorize
  	unless curent_user
      redirect_to home_path
    end
  end

  def curent_user
    if session[:client_id]
  	  @client ||= Client.find_by_id(session[:client_id])	
    elsif session[:cleaner_id]
      @cleaner ||= Cleaner.find_by_id(session[:cleaner_id])   
    end
  end

  helper_method :curent_user
  
  

end