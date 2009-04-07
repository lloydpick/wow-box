class CreateRealms < ActiveRecord::Migration
  def self.up
    create_table :realms do |t|
      t.string :name, :limit => 50
      t.string :permalink
      t.integer :region_id
      t.integer :realm_type_id
      t.integer :realm_language_id
      t.timestamps
    end

    Realm.create :name => "Al'Akir", :permalink => "alakir", :region_id => Region.find_by_code("eu").id, :realm_type_id => RealmType.find_by_shortname("PvP").id, :realm_language_id => RealmLanguage.find_by_code("enGB").id
    
  end

  def self.down
    drop_table :realms
  end
end
