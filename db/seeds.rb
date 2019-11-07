user = User.find_or_create_by(email: "me@email.com") do |user|
  user.password = "password1234"
  user.password_confirmation = "password1234"
end
