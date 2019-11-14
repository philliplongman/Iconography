# create User
user = User.find_or_create_by!(email: "me@email.com") do |u|
  u.password = "password1234"
  u.password_confirmation = "password1234"
end

# create standard Campaign
campaign = user.campaigns.find_or_create_by!(name: "13th Age Core Icons") do |c|
  c.description = <<~TEXT
    These are the standard icons as described in the 13th Age Core Rulebook.
  TEXT
end

# create Icons for standard campaign
standard_icon_data = {}.tap do |data|
  Dir.glob(Rails.root.join "vendor/icon_data/core/the_*").each do |icon_file|
    icon_attributes = YAML.safe_load(File.read icon_file)
    data.merge! icon_attributes
  end
end

standard_icon_data.each do |_icon_key, attributes|
  campaign.icons.find_or_create_by! attributes
end

# create Domains and Concerns for standard campaign
standard_concerns_data = YAML.safe_load(
  File.read("vendor/icon_data/core/concerns.yml"), symbolize_keys: true
)

standard_concerns_data.each do |concern|
  domain = campaign.domains.find_or_create_by!(name: concern[:domain])

  concern[:icons].each do |name|
    icon = Icon.find_by!(name: name)
    icon.concerns.find_or_create_by!(domain: domain)
  end
end
