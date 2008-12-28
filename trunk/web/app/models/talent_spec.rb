# == Schema Information
# Schema version: 20081228174748
#
# Table name: talent_specs
#
#  id         :integer         not null, primary key
#  role_id    :integer
#  name       :string(255)
#  permalink  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class TalentSpec < ActiveRecord::Base

  # Associations
  has_many :characters
  belongs_to :role

end
