json.extract! client, :id, :ClientNumber, :fname, :lname, :phone, :email, :status, :insurance, :created_at, :updated_at
json.url client_url(client, format: :json)
