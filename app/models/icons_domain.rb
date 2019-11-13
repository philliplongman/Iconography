# == Schema Information
#
# Table name: icons_domains
#
#  id        :integer          not null, primary key
#  icon_id   :integer          not null
#  domain_id :integer          not null
#
# Indexes
#
#  index_icons_domains_on_domain_id              (domain_id)
#  index_icons_domains_on_icon_id                (icon_id)
#  index_icons_domains_on_icon_id_and_domain_id  (icon_id,domain_id) UNIQUE
#

class IconsDomain < ApplicationRecord
  belongs_to :domain, touch: true
  belongs_to :icon,   touch: true

  validates :domain,  presence: true
  validates :icon,    presence: true
  validates :icon,    uniqueness: { scope: :domain }

end
