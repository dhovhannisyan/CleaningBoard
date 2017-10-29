module SessionsHelper

  def current_client=(client)
    @current_client = client
  end

  def current_client
    @current_client
  end

  def current_cleaner=(cleaner)
    @current_cleaner = cleaner
  end

  def current_cleaner
    @current_cleaner
  end

  def log_in_client(client)
    session[:client_id] = client.id
    self.current_client = client
    redirect_to client_page_path(client.id)
  end

  def log_out_client 
    self.current_client = nil
    session[:client_id] = nil
    redirect_to home_path
  end

  def log_in_cleaner(cleaner)
    session[:cleaner_id] = cleaner.id
    self.current_cleaner = cleaner
    redirect_to bookings_path  
  end

  def log_out_cleaner
    self.current_cleaner = nil
    session[:cleaner_id] = nil
    redirect_to home_path
  end

end
