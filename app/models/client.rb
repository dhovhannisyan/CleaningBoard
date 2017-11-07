class Client < ApplicationRecord

  include Password
  
  has_many  :bookings 
  validates :fname, presence: true, length: { minimum: 2 }
  validates :lname, presence: true, length: { minimum: 2 }
  validates_format_of :email, with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  before_save :password_to_md5

end
