# == Schema Information
#
# Table name: domains
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  campaign_id :integer          not null
#  notes       :text
#
# Indexes
#
#  index_domains_on_campaign_id           (campaign_id)
#  index_domains_on_name_and_campaign_id  (name,campaign_id) UNIQUE
#

class Domain < ApplicationRecord
  belongs_to :campaign, touch: true

  has_many :concerns, dependent: :destroy
  has_many :icons, -> { order :name }, through: :concerns
  has_many :relationships, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { scope: :campaign }

  def icon_names
    icons.pluck(:name)
  end

end
