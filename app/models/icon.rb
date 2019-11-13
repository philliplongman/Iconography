# == Schema Information
#
# Table name: icons
#
#  id               :integer          not null, primary key
#  campaign_id      :integer          not null
#  name             :string           not null
#  summary          :string(1000)
#  quote            :string
#  usual_location   :text
#  common_knowledge :text
#  adventurers      :text
#  allies           :text
#  enemies          :text
#  history          :text
#  true_danger      :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_icons_on_campaign_id           (campaign_id)
#  index_icons_on_name_and_campaign_id  (name,campaign_id) UNIQUE
#

class Icon < ApplicationRecord
  belongs_to :campaign, touch: true

  has_many :icons_domains, dependent: :destroy
  has_many :domains, through: :icons_domains

  validates :campaign,  presence: true
  validates :name,      presence: true
  validates :name,      uniqueness: { scope: :campaign }

end
