class AddHealthAndMetaBarToCharacterData < ActiveRecord::Migration
  def self.up
    change_table :character_datas do |t|
      t.remove :created_at
      t.remove :updated_at
      t.integer :health
      t.integer :meta
      t.timestamps
    end
  end

  def self.down
    change_table :character_datas do |t|
      t.remove :health
      t.remove :meta
    end
  end
end
