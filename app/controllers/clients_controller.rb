class ClientsController < ApplicationController

  before_action :set_client, only: [:show, :edit, :update, :destroy, :page, :bookings]
  #before_action :params_hash, only: [:update]

  def edit
    @path = client_edit_path
  end
  
  def update
    if @client.update(params_hash)
      redirect_to client_page_path
    else
      @notice = @client.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @client.destroy
    redirect_to logout_client_path
  end

  def page
    @bookings = @client.bookings
  end

  def bookings
    @bookings = @client.bookings
  end

  private

  def set_client
    @client = Client.find_by_id(session[:client_id].to_i)
    render_404 unless @client
  end

  def params_hash
    p_hash = {}
    p_hash[:fname] = params[:user][:fname] unless params[:user][:fname].empty?
    p_hash[:lname] = params[:user][:lname] unless params[:user][:lname].empty?
    p_hash[:email] = params[:user][:email] unless params[:user][:email].empty?
    p_hash[:password] = params[:user][:password] unless params[:user][:password].empty?
    p_hash
  end

  def client_params
    params.require(:user).permit(:fname, :lname, :email, :password)
  end

end
