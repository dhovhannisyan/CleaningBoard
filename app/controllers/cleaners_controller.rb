class CleanersController < ApplicationController

  before_action :set_cleaner
  before_action :authorize 
  

  def edit
    @path = cleaner_edit_path
  end

  def edit_city
    
    @cities = City.all
    @old_cities = @cleaner.cities.map &:id 
    
    if params[:city_ids] 
      @cleaner.cities.delete_all
      params[:city_ids].each do |i| 
        @cleaner.cities << City.find_by_id(i.to_i)
      end
      redirect_to cleaner_edit_city_path
    end

  end

  def edit_password
    
  end

  def change_password
    if @cleaner.check_password? params[:pass][:old]
      if params[:pass][:new] == params[:pass][:repeat] 
        unless params[:pass][:new].empty? 
          
          if @cleaner.update_password params[:pass][:new]
            redirect_to cleaner_page_path
          else
            @notice = @cleaner.errors.full_messages
            render 'edit_password' 
          end
        else
          @notice = ['fields are empry']
          render 'edit_password'
        end  
      else
        @notice = ['passwords do not match']
        render 'edit_password'
      end
    else
      @notice = ['invalid old password'] 
      render 'edit_password' 
    end
  end

  def update
    if @cleaner.update(cleaner_params.delete_if { |k, val| val.empty? })
      redirect_to cleaner_page_path
    else
      @notice = @cleaner.errors.full_messages
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
    params.require(:user).permit(:fname, :lname, :email)
  end

  
end
