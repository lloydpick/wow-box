class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name
      t.string :permalink
      t.timestamps
    end

    Role.create :name => "Death Knight", :permalink => "death-knight"
    Role.create :name => "Druid", :permalink => "druid"
    Role.create :name => "Hunter", :permalink => "hunter"
    Role.create :name => "Mage", :permalink => "mage"
    Role.create :name => "Paladin", :permalink => "paladin"
    Role.create :name => "Priest", :permalink => "priest"
    Role.create :name => "Rogue", :permalink => "rogue"
    Role.create :name => "Shaman", :permalink => "shaman"
    Role.create :name => "Warlock", :permalink => "warlock"
    Role.create :name => "Warrior", :permalink => "warrior"

  end

  def self.down
    drop_table :roles
  end
end
