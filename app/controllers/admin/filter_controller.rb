class Admin::FilterController < AdminController

	def client_filter

	  if params[:client]

      fname = params[:client][:fname].empty? ? 
      params[:client][:fname] : 
      params[:client][:fname] + '%' 
      lname = params[:client][:lname].empty? ?
       params[:client][:lname] : 
       params[:client][:lname] + '%'
      email = params[:client][:email].empty? ? 
      params[:client][:email] : 
      params[:client][:email] + '%'
      @clients = Client.where(
			                       'fname LIKE ? OR 
			                       lname LIKE ? OR
			                       email LIKE ?',
			                       "#{fname}", 
			                       "#{lname}", 
			                       "#{email}"
			                      )
 	  end
  end

	def cleaner_filter

		if params[:cleaner]

      fname = params[:cleaner][:fname].empty? ? 
      params[:cleaner][:fname] : 
      params[:cleaner][:fname] + '%' 
      lname = params[:cleaner][:lname].empty? ?
      params[:cleaner][:lname] : 
      params[:cleaner][:lname] + '%'
      email = params[:cleaner][:email].empty? ? 
      params[:cleaner][:email] : 
      params[:cleaner][:email] + '%'
      @cleaners = Cleaner.where(
			                       'fname LIKE ? OR 
			                       lname LIKE ? OR
			                       email LIKE ?',
			                       "#{fname}", 
			                       "#{lname}", 
			                       "#{email}"
			                      )
 	  end
      
	end

	def booking_filter
	  
	end

	def city_filter
		
	end
  
end