user = User.find_or_create_by(email: "me@email.com") do |u|
  u.password = "password1234"
  u.password_confirmation = "password1234"
end

campaign = user.campaigns.find_or_create_by(name: "13th Age Core Icons") do |c|
  c.description = <<~TEXT
    These are the standard icons as described in the 13th Age Core Rulebook.
  TEXT
end

standard_icon_data = {}.tap do |data|
  Dir.glob(Rails.root.join "vendor/icon_data/core/**/*").each do |icon_file|
    icon_attributes = YAML.safe_load(File.read icon_file)
    data.merge! icon_attributes
  end
end

standard_icon_data.each do |_icon_key, attributes|
  campaign.icons.find_or_create_by attributes
end
