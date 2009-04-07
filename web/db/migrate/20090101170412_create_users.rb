class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :password, :limit => 32
      t.string :nickname
      t.integer :level, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
