class RegistrationController < ApplicationController

 

	def for_client
	  @client = Client.new
	  @path = registration_client_path
    
    @form_title = 'SignUp Client'
	end

	def for_cleaner
    @cleaner = Cleaner.new
    @cities = City.all
    @path = registration_cleaner_path
    
    @form_title = 'SignUp Cleaner'
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
      @notice = @cleaner.errors.full_messages
      @cities = City.all
      @form_title = 'Regstration Cleaner'
      render 'for_cleaner'
    end 
  end

  def create_client
    @client = Client.new(user_params)
    if @client.save
      redirect_to login_client_path
    else
      @notice = @client.errors.full_messages
      @form_title = 'Regstration Client'
      render 'for_client'
    end
  end   

  def user_params
    params.require(:user).permit(:fname, :lname, :email, :password)
  end
	  

end
