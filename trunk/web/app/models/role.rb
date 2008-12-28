# == Schema Information
# Schema version: 20081222235246
#
# Table name: roles
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  permalink  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Role < ActiveRecord::Base

  # Associations
  has_many :characters
  has_many :talent_specs

end
