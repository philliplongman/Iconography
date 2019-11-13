# == Schema Information
#
# Table name: domains
#
#  id          :integer          not null, primary key
#  name        :string
#  campaign_id :integer          not null
#
# Indexes
#
#  index_domains_on_campaign_id           (campaign_id)
#  index_domains_on_name_and_campaign_id  (name,campaign_id) UNIQUE
#

class Domain < ApplicationRecord
  belongs_to :campaign, touch: true

  has_many :icons_domains, dependent: :destroy
  has_many :icons, through: :icons_domains

end
