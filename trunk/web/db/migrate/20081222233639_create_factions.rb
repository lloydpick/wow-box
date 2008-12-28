class CreateFactions < ActiveRecord::Migration
  def self.up
    create_table :factions do |t|
      t.string :name
      t.string :permalink
      t.timestamps
    end

    Faction.create :name => "Alliance", :permalink => "alliance"
    Faction.create :name => "Horde", :permalink => "horde"

  end

  def self.down
    drop_table :factions
  end
end
