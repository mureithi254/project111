class Emergency < ApplicationRecord
  belongs_to :client

  geocoded_by :address
  after_validation :geocode
end
