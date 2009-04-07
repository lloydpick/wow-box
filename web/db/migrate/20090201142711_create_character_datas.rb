class CreateCharacterDatas < ActiveRecord::Migration
  def self.up
    create_table :character_datas do |t|
      t.integer :character_id
      t.integer :base_stat_strength
      t.integer :base_stat_agility
      t.integer :base_stat_stamina
      t.integer :base_stat_intellect
      t.integer :base_stat_spirit
      t.integer :base_stat_armour
      t.integer :melee_damage_min
      t.integer :melee_damage_max
      t.float :melee_speed
      t.integer :melee_attack_power
      t.integer :melee_hit_rating
      t.float :melee_hit_rating_percent
      t.float :melee_crit_chance
      t.integer :melee_expertise
      t.integer :ranged_damage_min
      t.integer :ranged_damage_max
      t.float :ranged_speed
      t.integer :ranged_attack_power
      t.integer :ranged_hit_rating
      t.float :ranged_hit_rating_percent
      t.float :ranged_crit_chance
      t.integer :spell_bonus_damage
      t.integer :spell_bonus_healing
      t.integer :spell_hit_rating
      t.float :spell_hit_rating_percent
      t.float :spell_crit_chance
      t.integer :spell_haste
      t.float :spell_haste_percent
      t.float :spell_mana_regen_casting
      t.float :spell_mana_regen_not_casting
      t.integer :defenses_defense_rating
      t.float :defenses_dodge_percentage
      t.float :defenses_parry_percentage
      t.float :defenses_block_percentage
      t.integer :defenses_resilience
      t.timestamps
    end
  end

  def self.down
    drop_table :character_datas
  end
end
