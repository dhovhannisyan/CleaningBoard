class ClientsController < ApplicationController

  before_action :set_client
  before_action :authorize
  

  def edit
    
  end

  def edit_password

  end

  def change_password
    if @client.check_password? params[:pass][:old]
      if params[:pass][:new] == params[:pass][:repeat] 
        unless params[:pass][:new].empty? 
          @client.update_password params[:pass][:new]
          if @client.save
            redirect_to client_page_path
          else
            @notice = @client.errors.full_messages
            render 'edit_password' 
          end
        else
          @notice = ['new fields are empry']
          render 'edit_password'
        end  
      else
        @notice = ['new passwords do not match']
        render 'edit_password'
      end
    else
      @notice = ['invalid old password'] 
      render 'edit_password' 
    end
  end
  
  def update
    updates = client_params.delete_if { |k, val| val.empty? }
    if updates.empty?
      @notice = ['fields are empty']
      render 'edit'
    else
      if @client.update(updates)
        redirect_to client_page_path
      else
        @notice = @client.errors.full_messages
        render 'edit'
      end
    end
  end

  def destroy
    @client.destroy
    redirect_to logout_client_path
  end

  def page
   
  end

  def bookings
    @bookings = @client.bookings
  end

  private

  def set_client
    @client = Client.find_by_id(session[:client_id].to_i)
  end

  def client_params
    params.require(:user).permit(:fname, :lname, :email)
  end

  

end
