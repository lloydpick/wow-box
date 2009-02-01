class AddLevelToCharacter < ActiveRecord::Migration
  def self.up
    change_table :characters do |t|
      t.integer :level
    end
  end

  def self.down
    change_table :characters do |t|
      t.remove :level
    end
  end
end
