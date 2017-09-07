json.extract! hospital, :id, :address, :latitude, :longitude, :name, :phone, :email, :created_at, :updated_at
json.url hospital_url(hospital, format: :json)
