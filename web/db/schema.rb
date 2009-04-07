# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090201170007) do

  create_table "character_datas", :force => true do |t|
    t.integer  "character_id"
    t.integer  "base_stat_strength"
    t.integer  "base_stat_agility"
    t.integer  "base_stat_stamina"
    t.integer  "base_stat_intellect"
    t.integer  "base_stat_spirit"
    t.integer  "base_stat_armour"
    t.integer  "melee_damage_min"
    t.integer  "melee_damage_max"
    t.float    "melee_speed"
    t.integer  "melee_attack_power"
    t.integer  "melee_hit_rating"
    t.float    "melee_hit_rating_percent"
    t.float    "melee_crit_chance"
    t.integer  "melee_expertise"
    t.integer  "ranged_damage_min"
    t.integer  "ranged_damage_max"
    t.float    "ranged_speed"
    t.integer  "ranged_attack_power"
    t.integer  "ranged_hit_rating"
    t.float    "ranged_hit_rating_percent"
    t.float    "ranged_crit_chance"
    t.integer  "spell_bonus_damage"
    t.integer  "spell_bonus_healing"
    t.integer  "spell_hit_rating"
    t.float    "spell_hit_rating_percent"
    t.float    "spell_crit_chance"
    t.integer  "spell_haste"
    t.float    "spell_haste_percent"
    t.float    "spell_mana_regen_casting"
    t.float    "spell_mana_regen_not_casting"
    t.integer  "defenses_defense_rating"
    t.float    "defenses_dodge_percentage"
    t.float    "defenses_parry_percentage"
    t.float    "defenses_block_percentage"
    t.integer  "defenses_resilience"
    t.integer  "resistance_arcane"
    t.integer  "resistance_fire"
    t.integer  "resistance_frost"
    t.integer  "resistance_holy"
    t.integer  "resistance_nature"
    t.integer  "resistance_shadow"
    t.integer  "health"
    t.integer  "meta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "character_items", :force => true do |t|
    t.integer  "character_id"
    t.integer  "item_slot_id"
    t.integer  "item_id"
    t.integer  "gem1_id"
    t.integer  "gem2_id"
    t.integer  "gem3_id"
    t.string   "icon"
    t.integer  "enchant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "character_ratings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "character_id"
    t.integer  "rating"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "characters", :force => true do |t|
    t.string   "name"
    t.string   "permalink"
    t.integer  "user_id"
    t.integer  "role_id"
    t.integer  "talent_spec_id"
    t.integer  "guild_id"
    t.integer  "race_id"
    t.integer  "faction_id"
    t.integer  "realm_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "level"
  end

  create_table "factions", :force => true do |t|
    t.string   "name"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guilds", :force => true do |t|
    t.string   "name"
    t.string   "permalink"
    t.integer  "realm_id"
    t.integer  "faction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "races", :force => true do |t|
    t.string   "name"
    t.string   "permalink"
    t.integer  "faction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "realm_languages", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "realm_types", :force => true do |t|
    t.string   "name"
    t.string   "shortname"
    t.string   "description"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "realms", :force => true do |t|
    t.string   "name",              :limit => 50
    t.string   "permalink"
    t.integer  "region_id"
    t.integer  "realm_type_id"
    t.integer  "realm_language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", :force => true do |t|
    t.string   "area",       :limit => 30
    t.string   "code",       :limit => 5
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "talent_specs", :force => true do |t|
    t.integer  "role_id"
    t.string   "name"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password",   :limit => 32
    t.string   "nickname"
    t.integer  "level",                    :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
