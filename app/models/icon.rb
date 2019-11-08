# == Schema Information
#
# Table name: icons
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  blurb       :string(1000)
#  description :text
#  campaign_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_icons_on_campaign_id           (campaign_id)
#  index_icons_on_name_and_campaign_id  (name,campaign_id) UNIQUE
#

class Icon < ApplicationRecord
  belongs_to :campaign

  validates :name, presence: true
  validates :name, uniqueness: { scope: :campaign }
  validates :blurb, length: { max: 1000 }

end
