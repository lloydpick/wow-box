# == Schema Information
# Schema version: 20090201161128
#
# Table name: character_ratings
#
#  id           :integer         not null, primary key
#  user_id      :integer
#  character_id :integer
#  rating       :integer
#  comment      :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class CharacterRating < ActiveRecord::Base
end
