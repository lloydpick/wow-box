class CreateGuilds < ActiveRecord::Migration
  def self.up
    create_table :guilds do |t|
      t.string :name
      t.string :permalink
      t.integer :realm_id
      t.integer :faction_id
      t.timestamps
    end

    Guild.create(
      :name => "kthxbye",
      :permalink => "kthxbye",
      :faction_id => Faction.find_by_permalink("horde").id,
      :realm_id => Realm.find_by_permalink("alakir").id
    )

  end

  def self.down
    drop_table :guilds
  end
end
