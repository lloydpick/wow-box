# == Schema Information
# Schema version: 20081222235246
#
# Table name: regions
#
#  id         :integer         not null, primary key
#  area       :string(30)
#  code       :string(5)
#  permalink  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Region < ActiveRecord::Base

  # Associations
  has_many :realms

end
