class BookingsController < ApplicationController

  def book 
    @options = City.all.map { |city| [city.name, city.id] }
  end

  def check_cleaner
    
    session[:date] = params[:date]
    session[:city_id] = params[:city]

    
    cleaners = City.find_by_id(params[:city].to_i).cleaners 

    valid_cleaners = []
    cleaners.each_with_index do |cleaner, i|
      valid = true
      cleaner.bookings.each do |cleaner| 
        if cleaner.date_to_s == session[:date]
          valid = false
          break
        end
      end
      valid_cleaners << cleaners[i] if valid
    end

    if valid_cleaners.empty?
      @notice = "no free cleaners on #{session[:date]}"
    else     
      @options = valid_cleaners.map { |cleaner| [cleaner.fname, cleaner.id] } 
    end

  end
  
  def create
    d = session[:date].split('.').map { |param| param.to_i }
    date = Date.new(d[2], d[1], d[0]) 
    t = Time.now
    time = "#{t.day}.#{t.month}.#{t.year} _ #{t.hour}:#{t.min}:#{t.sec}"
    booking = Booking.new({
                            client_id: session[:client_id], 
                            cleaner_id: params[:cleaner_id],
                            city_id: session[:city_id],
                            date: date,
                            time: time
                          })
    session[:date] = nil
    session[:city_id] = nil
    if booking.save
      redirect_to client_page_path 
    end
  end

  def destroy 
    booking = Booking.find_by_id params[:id]
    booking.destroy
  end

  def show
    @booking = Booking.find_by_id(params[:id])
    @booking.update read: true
  end

end
