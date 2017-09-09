class Emergency < ApplicationRecord
  belongs_to :client ,:dependent => :destroy

  geocoded_by :address
  after_validation :geocode
end
