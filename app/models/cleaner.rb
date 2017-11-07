class Cleaner < ApplicationRecord
 
  include Password

  has_many :bookings
  has_and_belongs_to_many :cities
  validates :fname, presence: true, length: { minimum: 2 }
  validates :lname, presence: true, length: { minimum: 2 }
  validates_format_of :email, with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  before_save :password_to_md5

  scope :search_cleaner, -> (options = {})  do
 
  	cleaners = Cleaner.all
  	  
  	if options[:patterns].present?
      patterns = options[:patterns].downcase.split(' ').map! { |t| "#{t}%" } 
      field_names, query = ['fname', 'lname', 'email'], []
      patterns.length.times do |i|
        query[i] = "#{field_names[i]} LIKE ?"
      end
      cleaners = cleaners.where(query.join(' AND '), *patterns)
    end

    unless options[:cities].empty? 
      cleaners = cleaners.joins(:cities).where(cities: {id: options[:cities]}).distinct
    end

    if options[:date].present?
    	cleaners = cleaners.joins(:bookings).where(bookings: {date: options[:date]}).distinct
    end

    cleaners
    
  end



end

