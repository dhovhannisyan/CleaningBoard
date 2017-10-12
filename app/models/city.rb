class City < ApplicationRecord

  has_and_belongs_to_many :cleaners
  has_and_belongs_to_many :clients
  validates :name, presence: true, length: {minimum: 2}

end
