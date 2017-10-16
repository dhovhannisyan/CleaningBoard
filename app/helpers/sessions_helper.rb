module SessionsHelper

  def current_client=(client)
    @current_client = client
  end

  def current_client
    @current_client
  end

  def log_in(client)
    session[:client_id] = client.id
    self.current_client = client
    redirect_to bookings_path
  end

  def log_out 
    self.current_client = nil
    session[:client_id] = nil
    redirect_to home_path
  end

end
