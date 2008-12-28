class CreateRealmTypes < ActiveRecord::Migration
  def self.up
    create_table :realm_types do |t|
      t.string :name
      t.string :shortname
      t.string :description
      t.string :permalink
      t.timestamps
    end

    RealmType.create :name => "Player vs Player", :shortname => "PvP", :permalink => "pvp", :description => "Player vs Player"
    RealmType.create :name => "Player vs Environment", :shortname => "PvE", :permalink => "pve", :description => "Player vs Environment"
    RealmType.create :name => "Role Play", :shortname => "RP", :permalink => "rp", :description => "Role Play"
    RealmType.create :name => "Role Play Player vs Player", :shortname => "RPPVP", :permalink => "rppvp", :description => "Role Play Player vs Player"
    
  end

  def self.down
    drop_table :realm_types
  end
end
