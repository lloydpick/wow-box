class CreateRegions < ActiveRecord::Migration
  def self.up
    create_table :regions do |t|
      t.string :area, :limit => 30
      t.string :code, :limit => 5
      t.string :permalink
      t.timestamps
    end

    Region.create :code => "eu", :area => "Europe", :permalink => "eu"
    
  end

  def self.down
    drop_table :regions
  end
end
