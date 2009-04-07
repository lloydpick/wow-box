class CreateRealmLanguages < ActiveRecord::Migration
  def self.up
    create_table :realm_languages do |t|
      t.string :name
      t.string :code
      t.string :permalink
      t.timestamps
    end

    RealmLanguage.create :name => "English", :code => "enGB", :permalink => "en_gb"

  end

  def self.down
    drop_table :realm_languages
  end
end
