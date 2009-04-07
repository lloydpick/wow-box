# == Schema Information
# Schema version: 20081223002010
#
# Table name: guilds
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  permalink  :string(255)
#  realm_id   :integer
#  faction_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Guild < ActiveRecord::Base

  # Associations
  belongs_to :realm
  belongs_to :faction
  has_many :characters

  # Extras
  has_permalink :name

  # Named Scopes
  named_scope :by_name, { :order => 'name ASC' }

  def to_param
    self.permalink
  end

end
