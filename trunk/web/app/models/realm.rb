# == Schema Information
# Schema version: 20081222235246
#
# Table name: realms
#
#  id                :integer         not null, primary key
#  name              :string(50)
#  permalink         :string(255)
#  region_id         :integer
#  realm_type_id     :integer
#  realm_language_id :integer
#  created_at        :datetime
#  updated_at        :datetime
#

class Realm < ActiveRecord::Base

  # Associations
  belongs_to :region
  belongs_to :realm_type
  belongs_to :realm_language
  has_many :characters
  has_many :guilds

  def to_param
    self.permalink
  end

end
