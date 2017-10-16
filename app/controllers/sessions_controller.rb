class SessionsController < ApplicationController

  def new
    
  end

  def create
    client = Client.find_by_email(params[:email])
    if client
      if client.password == params[:password]
        self.log_in(client) 
      else
        @notice = 'invalid password'
        render :new
      end
    else
      @notice = 'invalid email'
      render :new
    end
  end

  def destroy 
    log_out
  end

end
