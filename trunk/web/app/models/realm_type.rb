# == Schema Information
# Schema version: 20081222235246
#
# Table name: realm_types
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  shortname   :string(255)
#  description :string(255)
#  permalink   :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class RealmType < ActiveRecord::Base

  # Associations
  has_many :realms

  # Extras
  has_permalink :shortname

end
