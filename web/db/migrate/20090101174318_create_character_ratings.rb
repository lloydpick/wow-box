class CreateCharacterRatings < ActiveRecord::Migration
  def self.up
    create_table :character_ratings do |t|
      t.integer :user_id
      t.integer :character_id
      t.integer :rating
      t.string :comment
      t.timestamps
    end
  end

  def self.down
    drop_table :character_ratings
  end
end
