# == Schema Information
# Schema version: 20090201161128
#
# Table name: character_datas
#
#  id                           :integer         not null, primary key
#  character_id                 :integer
#  base_stat_strength           :integer
#  base_stat_agility            :integer
#  base_stat_stamina            :integer
#  base_stat_intellect          :integer
#  base_stat_spirit             :integer
#  base_stat_armour             :integer
#  melee_damage_min             :integer
#  melee_damage_max             :integer
#  melee_speed                  :float
#  melee_attack_power           :integer
#  melee_hit_rating             :integer
#  melee_hit_rating_percent     :float
#  melee_crit_chance            :float
#  melee_expertise              :integer
#  ranged_damage_min            :integer
#  ranged_damage_max            :integer
#  ranged_speed                 :float
#  ranged_attack_power          :integer
#  ranged_hit_rating            :integer
#  ranged_hit_rating_percent    :float
#  ranged_crit_chance           :float
#  spell_bonus_damage           :integer
#  spell_bonus_healing          :integer
#  spell_hit_rating             :integer
#  spell_hit_rating_percent     :float
#  spell_crit_chance            :float
#  spell_haste                  :integer
#  spell_haste_percent          :float
#  spell_mana_regen_casting     :float
#  spell_mana_regen_not_casting :float
#  defenses_defense_rating      :integer
#  defenses_dodge_percentage    :float
#  defenses_parry_percentage    :float
#  defenses_block_percentage    :float
#  defenses_resilience          :integer
#  created_at                   :datetime
#  updated_at                   :datetime
#

class CharacterData < ActiveRecord::Base

  # Associations
  belongs_to :character

end
