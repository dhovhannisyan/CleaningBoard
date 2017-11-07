class BookingsController < ApplicationController

  before_action :authorize
  

  def book 
    @options = City.all.map { |city| [city.name, city.id] }
    puts '#' * 100
    # puts p request
    puts '#' * 100
  end

  def check_cleaner

    if /[0-9][0-9]\.[0-9][0-9]\.201[0-9]/ =~ params[:date]
      session[:date] = params[:date]
      session[:city_id] = params[:city] 
    else
      @notice = ['invalid data format!', 'exemple of format "01.01.2017"']
      @options = City.all.map { |city| [city.name, city.id] }
      render 'book.html.erb'
    end
    

     
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
      redirect_to client_bookings_path 
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
