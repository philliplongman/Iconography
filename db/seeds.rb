user = User.find_or_create_by(email: "me@email.com") do |u|
  u.password = "password1234"
  u.password_confirmation = "password1234"
end

user.campaigns.find_or_create_by(name: "13th Age Core Icons") do |c|
  c.description = <<~TEXT
    These are the standard icons as described in the 13th Age Core Rulebook.
  TEXT
end
