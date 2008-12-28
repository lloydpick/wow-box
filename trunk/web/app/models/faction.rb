# == Schema Information
# Schema version: 20081222235246
#
# Table name: factions
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  permalink  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Faction < ActiveRecord::Base

  # Associations
  has_many :characters
  has_many :guilds
  has_many :races

end
