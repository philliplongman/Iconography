# == Schema Information
#
# Table name: campaigns
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_campaigns_on_name_and_user_id  (name,user_id) UNIQUE
#  index_campaigns_on_user_id           (user_id)
#

class Campaign < ApplicationRecord
  belongs_to :user

  has_many :icons, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { scope: :user }

end
