class Admin < ApplicationRecord
  
  # EMAIL_REGEX = /\A[a-z0-9._%+-]+[a-z0-9.-]+\.[a-z]{2,4}\z/i
  # validates_presence_of :email
  # validates_length_of :email,:maximum => 100
  # validates_format_of :email,:with => EMAIL_REGEX
  has_secure_password
end
