# == Schema Information
#
# Table name: icons_relationships
#
#  id              :integer          not null, primary key
#  relationship_id :integer          not null
#  icon_id         :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_icons_relationships_on_icon_id                      (icon_id)
#  index_icons_relationships_on_relationship_id              (relationship_id)
#  index_icons_relationships_on_relationship_id_and_icon_id  (relationship_id,icon_id) UNIQUE
#

class IconsRelationship < ApplicationRecord
  belongs_to :relationship, touch: true
  belongs_to :icon, touch: true

  validates :icon,          presence: true
  validates :relationship,  presence: true
  validates :relationship,  uniqueness: { scope: %i[icon] }

end
