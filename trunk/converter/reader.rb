require 'rubyluabridge'

mystring = ''
File.open("CharacterLogger.lua", "r") { |f|
    mystring = f.read
}

l = Lua::State.new
l.eval mystring

l.CL_Data.each_key do |realm|
  l.CL_Data[realm].each_key do |character|
    faction = nil
    guild = nil

    if l.CL_Data[realm][character]['faction']
      faction = l.CL_Data[realm][character]['faction']
    end
    if l.CL_Data[realm][character]['guild']
      guild = l.CL_Data[realm][character]['guild']
    end

    print "#{realm}\t#{character}\t#{faction}\t#{guild}\n"

  end
end
