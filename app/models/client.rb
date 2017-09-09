class Client < ApplicationRecord
	has_many :emergencies
	validates :fname,:lname,:phone,:status,presence: { message: "This fields is compulsory" }

end
