class Hospital < ApplicationRecord
	geocoded_by :address
	after_validation :geocode

	validates :address,:name,:phone,:email ,presence: {message: 'This field is compulsory'}
end
