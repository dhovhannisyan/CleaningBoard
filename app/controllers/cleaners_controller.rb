class CleanersController < ApplicationController

  before_action :set_cleaner, only: [:show, :edit, :update, :destroy, :page, :bookings]
  #before_action :params_hash, only: [:update]

  def edit
    @path = cleaner_edit_path
    @cities = City.all
  end

  def update
    if @cleaner.update(params_hash)
      redirect_to cleaner_page_path
    else
      @notice = @client.errors.full_messages
      render :edit 
    end
  end

  def destroy
    @cleaner.destroy
    redirect_to logout_cleaner_path
  end

  def page
    @bookings = @cleaner.bookings
  end

  def bookings
    @bookings = @cleaner.bookings
  end

  private
  
  def set_cleaner
    @cleaner = Cleaner.find_by_id(session[:cleaner_id])
  end

  def cleaner_params
    params[:user[:password]] = Digest::MD5.hexdigest(params[:user[:password]])
    params.require(:user).permit(:fname, :lname, :email, :password)
  end

  def params_hash
    p_hash = {}
    p_hash[:fname] = params[:user][:fname] unless params[:user][:fname].empty?
    p_hash[:lname] = params[:user][:lname] unless params[:user][:lname].empty?
    p_hash[:email] = params[:user][:email] unless params[:user][:email].empty?
    p_hash[:password] = params[:user][:password] unless params[:user][:password].empty?
    p_hash
  end

end
