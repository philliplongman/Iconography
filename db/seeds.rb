user = User.find_or_create_by(email: "me@email.com") do |u|
  u.password = "password1234"
  u.password_confirmation = "password1234"
end

campaign = user.campaigns.find_or_create_by(name: "13th Age Core Icons") do |c|
  c.description = <<~TEXT
    These are the standard icons as described in the 13th Age Core Rulebook.
  TEXT
end

campaign_data = File.read "lib/standard_icons.yml"
standard_campaign = YAML.safe_load campaign_data, symbolize_names: true

standard_campaign[:icons].each { |e| campaign.icons.find_or_create_by e }
