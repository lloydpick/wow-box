namespace :wowbox do

  namespace :import do

    desc "Looks up Borgy on the Armory"
    task :borgy => :environment do
      require 'wowr'

      api = Wowr::API.new(:locale => 'eu', :caching => true)
      c = api.get_character("Borgy", :realm => "Al'Akir")
      print c.klass
      print c.race
      print c.faction

    end


    desc "Go lookup one character on the armory that needs updating"
    task :get_basic_for_oldest => :environment do
      require 'wowr'

      char = Character.recent.find(:first, :conditions => { :role_id => nil, :race_id => nil })
      char.updated_at = Time.now
      char.save!

      api = Wowr::API.new(:locale => 'eu')
      armory = api.get_character(char.name, :realm => char.realm.name)

      char.role = Role.find_by_name(armory.klass)
      char.race = Race.find_by_name(armory.race)

      if armory.guild != nil
        char.guild = Guild.find_or_create_by_name_and_realm_id_and_faction_id(armory.guild, char.realm.id, char.faction.id)
      else
        char.guild_id = 0
      end

      char.save!

    end

    desc "Go lookup one character on the armory that needs updating - ADVANCED STATS"
    task :get_advanced_for_oldest => :environment do
      debug = false

      print "loading wowr\n" if debug
      require 'wowr'

      print "finding character\n" if debug
      if debug
        char = Character.find(3)
      else
        char = Character.needs_run.order.find(:first, :conditions => { :level => nil })
      end

      print "updating access time\n" if debug
      char.updated_at = Time.now

      print "saving character\n" if debug
      char.save!

      print "creating api\n" if debug
      api = Wowr::API.new(:locale => 'eu', :caching => true)

      sleep = rand(45)
      print "sleeping for #{sleep}seconds\n" if debug
      sleep(sleep)

      print "fetching player\n" if debug
      armory = api.get_character(char.name, :realm => char.realm.name)

      print "updating role\n" if debug
      char.role = Role.find_by_name(armory.klass)

      print "updating race\n" if debug
      char.race = Race.find_by_name(armory.race)

      print "checking guild\n" if debug
      if armory.guild != nil

        print "creating/finding guild\n" if debug
        char.guild = Guild.find_or_create_by_name_and_realm_id_and_faction_id(armory.guild, char.realm.id, char.faction.id)
      else

        print "no guild found\n" if debug
        char.guild_id = 0
      end

      print "updating level\n" if debug
      char.level = armory.level

      print "updating access time\n" if debug
      char.updated_at = Time.now

      print "saving character\n" if debug
      char.save!

      print "\n" if debug

      print "creating/finding character data\n" if debug
      data = CharacterData.find_or_create_by_character_id(char.id)

      print "updating base stats\n" if debug
      data.base_stat_strength = armory.strength.effective
      data.base_stat_agility = armory.agility.effective
      data.base_stat_stamina = armory.stamina.effective
      data.base_stat_intellect = armory.intellect.effective
      data.base_stat_spirit = armory.spirit.effective
      data.base_stat_armour = armory.defenses.armor.effective

      print "updating melee stats\n" if debug
      data.melee_damage_min = armory.melee.main_hand_damage.min
      data.melee_damage_max = armory.melee.main_hand_damage.max
      data.melee_speed = armory.melee.main_hand_damage.speed
      data.melee_attack_power = armory.melee.power.haste_rating
      data.melee_hit_rating = armory.melee.hit_rating.value
      data.melee_hit_rating_percent = armory.melee.hit_rating.increased_hit_percent
      data.melee_crit_chance = armory.melee.crit_chance.percent
      data.melee_expertise = armory.melee.expertise.value

      print "updating ranged stats\n" if debug
      data.ranged_damage_min = armory.ranged.damage.min
      data.ranged_damage_max = armory.ranged.damage.max
      data.ranged_speed = armory.ranged.speed.value
      data.ranged_attack_power = armory.ranged.power.haste_rating
      data.ranged_hit_rating = armory.ranged.hit_rating.value
      data.ranged_hit_rating_percent = armory.ranged.hit_rating.increased_hit_percent
      data.ranged_crit_chance = armory.ranged.crit_chance.percent

      print "updating spell stats\n" if debug
      data.spell_bonus_damage = armory.spell.arcane.value
      data.spell_bonus_healing = armory.spell.bonus_healing
      data.spell_hit_rating = armory.spell.hit_rating.value
      data.spell_hit_rating_percent = armory.spell.hit_rating.increased_hit_percent
      data.spell_crit_chance = armory.spell.arcane.crit_chance_percent
      data.spell_haste = armory.spell.speed.haste_rating
      data.spell_haste_percent = armory.spell.speed.percent_increase
      data.spell_mana_regen_casting = armory.spell.mana_regen.casting
      data.spell_mana_regen_not_casting = armory.spell.mana_regen.not_casting

      print "updating defence stats\n" if debug
      data.defenses_defense_rating = armory.defenses.defense.rating
      data.defenses_dodge_percentage = armory.defenses.dodge.percent
      data.defenses_parry_percentage = armory.defenses.parry.percent
      data.defenses_block_percentage = armory.defenses.block.percent
      data.defenses_resilience = armory.defenses.resilience.value

      print "updating resistances\n" if debug
      data.resistance_arcane = armory.resistances["arcane"].value
      data.resistance_fire = armory.resistances["fire"].value
      data.resistance_frost = armory.resistances["frost"].value
      data.resistance_holy = armory.resistances["holy"].value
      data.resistance_nature = armory.resistances["nature"].value
      data.resistance_shadow = armory.resistances["shadow"].value

      print "updating health/meta stats\n" if debug
      data.health = armory.health
      data.meta = armory.second_bar.effective

      print "creating/finding/updating character gear\n" if debug
      armory.items.each do |item|
        gear = CharacterItem.find_or_create_by_character_id_and_item_slot_id(char.id, item.slot)
        gear.item_id = item.id
        gear.gem1_id = item.gems[0]
        gear.gem2_id = item.gems[1]
        gear.gem3_id = item.gems[2]
        gear.icon = item.icon_base
        gear.enchant_id = item.permanent_enchant
        gear.save!
      end

      print "setting access time\n" if debug
      data.updated_at = Time.now

      print "saving character data\n" if debug
      data.save!

      print "\n" if debug
      print "Done!\n" if debug

    end

    desc "Imports all character data from file"
    task :from_file => :environment do
      require 'rubyluabridge'
      require 'wowr'

      # Controls if we query the armory or not
      use_armory = false

      data = ''
      File.open("public/CharacterLogger.lua", "r") { |f| data = f.read }

      l = Lua::State.new
      l.eval data

      api = Wowr::API.new(:locale => 'eu', :caching => false) if use_armory

      # Each realm
      l.CL_Data.each_key do |realm|

        db_realm = Realm.find_or_create_by_name(realm)
        
        # Each character
        l.CL_Data[realm].each_key do |character|

          # Because we dont want to save it inbetween
          faction = nil
          guild = nil
          armory = nil

          if character.length > 1

            # Get faction
            if l.CL_Data[realm][character]['faction']
              faction = l.CL_Data[realm][character]['faction']
            end

            # Get realm
            if l.CL_Data[realm][character]['guild']
              guild = l.CL_Data[realm][character]['guild']
            end

            char = Character.find_or_initialize_by_name_and_realm_id(character, db_realm.id)

            # If no role, assume no other armory data
            if not char.role

              if use_armory
                armory = api.get_character(character, :realm => realm)
                char.role = Role.find_by_name(armory.klass)
                char.race = Race.find_by_name(armory.race)
              end

              db_faction = char.faction = Faction.find_by_name(faction)

              if guild != nil
                char.guild = Guild.find_or_create_by_name_and_realm_id_and_faction_id(guild, db_realm.id, db_faction.id)
              else
                char.guild_id = 0
              end

              char.user_id = 0

            end

            char.save!

          end

        end
        
      end
      
    end

  end

end