class CreateRaces < ActiveRecord::Migration
  def self.up
    create_table :races do |t|
      t.string :name
      t.string :permalink
      t.integer :faction_id
      t.timestamps
    end

    alliance = Faction.find_by_permalink("alliance").id
    horde = Faction.find_by_permalink("horde").id

    Race.create :name => "Human", :permalink => "human", :faction_id => alliance
    Race.create :name => "Dwarf", :permalink => "dwarf", :faction_id => alliance
    Race.create :name => "Night Elf", :permalink => "nightelf", :faction_id => alliance
    Race.create :name => "Gnome", :permalink => "gnome", :faction_id => alliance
    Race.create :name => "Draenei", :permalink => "draenei", :faction_id => alliance

    Race.create :name => "Orc", :permalink => "orc", :faction_id => horde
    Race.create :name => "Undead", :permalink => "undead", :faction_id => horde
    Race.create :name => "Tauren", :permalink => "tauren", :faction_id => horde
    Race.create :name => "Troll", :permalink => "troll", :faction_id => horde
    Race.create :name => "Blood Elf", :permalink => "bloodelf", :faction_id => horde

  end

  def self.down
    drop_table :races
  end
end
