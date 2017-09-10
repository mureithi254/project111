class Emergency < ApplicationRecord
  belongs_to :client ,:dependent => :destroy

  geocoded_by :address
  after_validation :geocode

  validates :address,:description,:client_id ,presence: {message: "This field is compulsory"}
end
