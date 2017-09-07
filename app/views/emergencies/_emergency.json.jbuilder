json.extract! emergency, :id, :address, :latitude, :longitude, :description, :client_id, :created_at, :updated_at
json.url emergency_url(emergency, format: :json)
