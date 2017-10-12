json.extract! client, :id, :fname, :lname, :email, :password, :created_at, :updated_at
json.url client_url(client, format: :json)
