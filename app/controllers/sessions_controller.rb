class SessionsController < ApplicationController

  def for_client
    @path = login_client_path
    @form_title = 'Login Client'
  end

  def for_cleaner
    @path = login_cleaner_path
    @form_title = 'Login Cleaner'
  end

  def create_client
    @client = Client.find_by_email(params[:email].strip)
    if @client
      if @client.check_password?(params[:password].strip)
        log_in_client(@client) 
      else
        @notice = 'invalid password'
        @form_title = 'Login Client'
        render 'for_client'
      end
    else
      @notice = 'invalid email'
      @form_title = 'Login Client'
      render 'for_client'
    end
  end

  def create_cleaner
    cleaner = Cleaner.find_by_email(params[:email].strip)
    if cleaner
      if cleaner.check_password?(params[:password].strip)
        log_in_cleaner(cleaner) 
      else
        @notice = 'invalid password'
        @form_title = 'Login Cleaner'
        render 'for_cleaner'
      end
    else
      @notice = 'invalid email'
      @form_title = 'Login Cleaner'
      render 'for_cleaner'
    end
  end
    
  def destroy_client
    log_out_client
  end

  def destroy_cleaner
    log_out_cleaner
  end
  
  private

  def log_in_client(client)
    session[:client_id] = client.id
    redirect_to client_page_path
  end

  def log_out_client 
    session[:client_id] = nil
    redirect_to home_path
  end

  def log_in_cleaner(cleaner)
    session[:cleaner_id] = cleaner.id
    redirect_to cleaner_page_path 
  end

  def log_out_cleaner
    session[:cleaner_id] = nil
    redirect_to home_path
  end

end
