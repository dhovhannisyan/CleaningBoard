class SessionsController < ApplicationController

  def new
    
  end

  def create
    
    client = Client.find_by_email(params[:email])
    if client
      client_id = client.id
      session[:client_id] = client_id
      redirect_to bookings_path
    else
      @notice = 'undefined client with mail "#{params[:email]}"'
      render :new
    end
    
  end

end
