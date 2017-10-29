class RegistrationController < ApplicationController

	def for_client
	  @client = Client.new
	  @path = registration_client_path
	end

	def for_cleaner
    @cleaner = Cleaner.new
    @cities = City.all
    @path = registration_cleaner_path
  end

  def create_cleaner
    @cleaner = Cleaner.new(user_params)
    if @cleaner.save
      cities = City.where(id: params[:city_ids]) 
      cities.each do |city|
        @cleaner.cities << city
      end
      redirect_to login_cleaner_path
    else
      @notice = @cleaner.errors.full_massages
      @cities = City.all
      render 'for_cleaner'
    end
  end

  def create_client
    @client = Client.new(user_params)
    if @client.save
      redirect_to login_client_path
    else
      render 'for_client'
    end
  end   

  def user_params
    params[:user][:password] = to_hex(params[:user][:password])
    params.require(:user).permit(:fname, :lname, :email, :password)
  end
	  

end
