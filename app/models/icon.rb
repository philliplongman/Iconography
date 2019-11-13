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

  validates :name, presence: true
  validates :name, uniqueness: { scope: :campaign }
  validates :summary, length: { maximum: 1000 }

end
