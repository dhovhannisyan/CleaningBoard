class Cleaner < ApplicationRecord

  has_many :bookings
  has_and_belongs_to_many :cities
  validates :fname, presence: true, length: { minimum: 2 }
  validates :lname, presence: true, length: { minimum: 2 }
  validates_format_of :email, with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

end
