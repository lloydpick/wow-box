class CreateCharacters < ActiveRecord::Migration
  def self.up
    create_table :characters do |t|
      t.string :name
      t.string :permalink
      t.integer :user_id
      t.integer :role_id
      t.integer :talent_spec_id
      t.integer :guild_id
      t.integer :race_id
      t.integer :faction_id
      t.integer :realm_id
      t.timestamps
    end

    Character.create(
      :name => "Borgy",
      :permalink => "borgy",
      :role_id => Role.find_by_permalink("hunter").id,
      :race_id => Race.find_by_permalink("tauren").id,
      :guild_id => Guild.find_by_permalink("kthxbye").id,
      :faction_id => Faction.find_by_permalink("horde").id,
      :realm_id => Realm.find_by_permalink("alakir").id,
      :talent_spec_id => 0,
      :user_id => 0
    )
  end

  def self.down
    drop_table :characters
  end
end
