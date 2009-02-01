namespace :wowbox do

  namespace :import do

    desc "Looks up Borgy on the Armory"
    task :borgy => :environment do
      require 'wowr'

      api = Wowr::API.new(:locale => 'eu', :caching => true)
      c = api.get_character("Malm", :realm => "Al'Akir")
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