# == Schema Information
# Schema version: 20081222235246
#
# Table name: realm_languages
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  code       :string(255)
#  permalink  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class RealmLanguage < ActiveRecord::Base

  # Associations
  has_many :realms

  # Extras
  has_permalink :name

end
