# == Schema Information
# Schema version: 20081222235246
#
# Table name: races
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  permalink  :string(255)
#  faction_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Race < ActiveRecord::Base

  # Associations
  belongs_to :faction
  has_many :characters

  # Extras
  has_permalink :name

end
