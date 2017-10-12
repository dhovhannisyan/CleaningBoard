class BookingsController < ApplicationController

  def book 
    @cleaners = Cleaner.all
    @options = @cleaners.map { |cleaner| [cleaner.fname, cleaner.id] }

  if params[:email] && params[:cleaner] && params[:date]
    # create data
    d = params[:date].split('/').map do |param|
      param.to_i
    end
    date = Date.new(d[2], d[1], d[0])

    # find client
    client_id = Client.find_by_email(params[:email].strip).id

    # get cleaner
    cleaner_id = params[:cleaner]

    # save booking
    booking = Booking.new({client_id: client_id, cleaner_id: cleaner_id, date: date})
    
    # mesaging
      if booking.save
        @notice = {msg: 'Booking was successfully created.', color: 'green', status: :saved}
      else
        errors = booking.errors.full_messages
        @notice = {msg: errors, color: 'red', status: :no_saved}
      end
  else
    @notice = {msg: 'pleas fill in all fields', color: 'green', status: :fill_in}
  end
    
 end

  def list 
    @bookings = Booking.all
  end

  def destroy 
    booking = Booking.find_by_id params[:id]
    booking.destroy
  end

end
