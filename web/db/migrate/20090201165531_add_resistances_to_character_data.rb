class AddResistancesToCharacterData < ActiveRecord::Migration
  def self.up
    change_table :character_datas do |t|
      t.remove :created_at
      t.remove :updated_at
      t.integer :resistance_arcane
      t.integer :resistance_fire
      t.integer :resistance_frost
      t.integer :resistance_holy
      t.integer :resistance_nature
      t.integer :resistance_shadow
      t.timestamps
    end
  end

  def self.down
    change_table :character_datas do |t|
      t.remove :resistance_arcane
      t.remove :resistance_fire
      t.remove :resistance_frost
      t.remove :resistance_holy
      t.remove :resistance_nature
      t.remove :resistance_shadow
    end
  end
end
