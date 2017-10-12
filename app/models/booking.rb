class Booking < ApplicationRecord

  belongs_to :cleaner
  belongs_to :client
  validates :date, uniqueness: {scope: :cleaner_id}

end
