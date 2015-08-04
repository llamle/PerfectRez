json.array!(@users) do |user|
  json.extract! user, :id, :user, :first_name, :last_name, :email, :password_digest, :session_id, :email_token
  json.url user_url(user, format: :json)
end
