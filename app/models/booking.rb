class Booking < ApplicationRecord

  belongs_to :cleaner
  belongs_to :client
  belongs_to :city
  validates :date, uniqueness: {scope: :cleaner_id}

  def date_to_s
  	day = self.date.day > 9 ? self.date.day.to_s : '0' + self.date.day.to_s
  	month = self.date.month > 9 ? self.date.month.to_s : '0' + self.date.month.to_s 
  	year = self.date.year.to_s
  	day + '.' + month + '.' + year 
  end


end
