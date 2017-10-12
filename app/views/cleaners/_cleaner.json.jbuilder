json.extract! cleaner, :id, :fname, :lname, :email, :password, :created_at, :updated_at
json.url cleaner_url(cleaner, format: :json)
