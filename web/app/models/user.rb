# == Schema Information
# Schema version: 20090201161128
#
# Table name: users
#
#  id         :integer         not null, primary key
#  email      :string(255)
#  password   :string(32)
#  nickname   :string(255)
#  level      :integer         default(0)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
end
