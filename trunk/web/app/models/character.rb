# == Schema Information
# Schema version: 20081223002010
#
# Table name: characters
#
#  id             :integer         not null, primary key
#  name           :string(255)
#  permalink      :string(255)
#  user_id        :integer
#  role_id        :integer
#  talent_spec_id :integer
#  guild_id       :integer
#  race_id        :integer
#  faction_id     :integer
#  realm_id       :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Character < ActiveRecord::Base

  # Associations
  belongs_to :role
  belongs_to :talent_spec
  belongs_to :guild
  belongs_to :race
  belongs_to :faction
  belongs_to :realm
  has_many :character_item
  has_many :character_data

  # Extras
  has_permalink :name

  # Validations
  validates_uniqueness_of :name, :scope => [ :realm_id ]

  # Scopes
  named_scope :recent, lambda { { :conditions => ['updated_at < ?', 1.week.ago] } }

end
