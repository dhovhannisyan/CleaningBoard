class Client < ApplicationRecord
  
  has_many  :bookings 
  validates :fname, presence: true, length: { minimum: 2 }
  validates :lname, presence: true, length: { minimum: 2 }
  validates_format_of :email, with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  
end
