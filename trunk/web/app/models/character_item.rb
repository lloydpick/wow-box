# == Schema Information
# Schema version: 20090201170007
#
# Table name: character_items
#
#  id           :integer         not null, primary key
#  character_id :integer
#  item_slot_id :integer
#  item_id      :integer
#  gem1_id      :integer
#  gem2_id      :integer
#  gem3_id      :integer
#  icon         :string(255)
#  enchant_id   :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class CharacterItem < ActiveRecord::Base

  # Associations
  belongs_to :character

end
