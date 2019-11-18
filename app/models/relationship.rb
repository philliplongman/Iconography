# == Schema Information
#
# Table name: relationships
#
#  id         :integer          not null, primary key
#  domain_id  :integer          not null
#  attitude   :integer          not null
#  major      :boolean          default("true"), not null
#  notes      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_relationships_on_domain_id  (domain_id)
#

class Relationship < ApplicationRecord
  enum attitude: %i[positive conflicted negative]

  belongs_to :domain, touch: true

  has_many :icons_relationships, dependent: :destroy
  has_many :icons, through: :icons_relationships

  validates :domain,  presence: true
  validates :type,    presence: true
  validates :major,   inclusion: { in: [true, false] }
  validates :type,    inclusion: { in: attitudes }

end
