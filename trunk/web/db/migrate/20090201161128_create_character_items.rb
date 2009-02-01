class CreateCharacterItems < ActiveRecord::Migration
  def self.up
    create_table :character_items do |t|
      t.integer :character_id
      t.integer :item_slot_id
      t.integer :item_id
      t.integer :gem1_id
      t.integer :gem2_id
      t.integer :gem3_id
      t.string :icon
      t.integer :enchant_id
      t.timestamps
    end
  end

  def self.down
    drop_table :character_items
  end
end
