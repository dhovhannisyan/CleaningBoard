class Admin::FilterController < AdminController

	def client_filter

	  if params[:client]
      query, with = [], []
	  	client_hash.each do |key, val|
	  		unless  val.empty?
          query << "#{key} LIKE ?"
          with << "#{val}%" 
        end
	  	end
	  	@clients = Client.where(query.join(' AND '), *with)
 	  end

  end

	def cleaner_filter
		@cities = City.all
		@cleaners = Cleaner.all

    if params[:cleaner]

     patterns = ''
     cleaner_params.each { |k, v| patterns += "#{v} " if v.present? }

     cities = params[:city_ids] ? params[:city_ids].map(&:to_i) : []

     date = params[:booking_date].present? ? book_date : '' 

     @cleaners = Cleaner.search_cleaner(patterns: patterns, cities: cities, date: date)

	end

    end

	def booking_filter
	  @bookings = Bookings.all
    end

	def city_filter
		
	end

	def client_hash
		params.require(:client).permit(:fname, :lname, :email)
	end

  def cleaner_params
		params.require(:cleaner).permit(:fname, :lname, :email)
	end

	def book_date
		data = params[:booking_date].split '.'
    return "#{data[2]}-#{data[1]}-#{data[0]}"
	end

end