# DUNGEON GAME

class Dungeon
	attr_accessor :player

	def initialize(player_name)
		@player = Player.new(player_name)
		@rooms = []
	end

# LONG WAY

	class Player
		attr_accessor :name, :location

		def initialize(name)
			@name = name
		end
	end


# USING STRUCTS

#Player = Struct.new(:name, :location)
# Room = Struct.new(:reference, :name, :description, :connections)



	class Room
		attr_accessor :reference, :name, :description, :connections

           def initialize(reference, name, description, connections)
			@reference = reference
			@name = name
			@description = description
			@connections = connections

		end
	end


# ADD ROOM
	def add_room(reference, name, description, connections)
		@rooms << Room.new(reference, name, description, connections)
	end

	def start(location)
		@player.location = location
		show_current_description
	end

	def show_current_description
		puts find_room_in_dungeon(@player.location).full_description
	end

	def find_room_in_dungeon(reference)
		@rooms.detect { |room| room.reference == reference}
	end

	def find_room_in_direction(direction)
		find_room_in_dungeon(@player.location).connections[direction]
	end

	def go(direction)


		puts "You decide to go " + direction.to_s
		@player.location = find_room_in_direction(direction)
		show_current_description
		
	end



	class Room
		def full_description
			@name + "\n\n~~~~~You are in " + @description
		end
	end

end


# create the main dungeon object
dungeongame = Dungeon.new("Fred Blizzoggs")

#add rooms to dungeon
dungeongame.add_room(:largecave, "Large Cave", "a large cavernous cave", {:west => :smallcave, :south => :lair})
dungeongame.add_room(:smallcave, "Small Cave", "a small narrow cave", {:east => :largecave, :south => :tunnel})
dungeongame.add_room(:lair, "Spider Lair", "a lair with a venomous spider", {:north => :largecave})
dungeongame.add_room(:tunnel, "Connecting Tunnel", "a dark tunnel", {:north => :smallcave})


#start dungeon by placing player in large cave
dungeongame.start(:largecave)

dungeongame.go(:west)

dungeongame.go(:east)


puts "Enter new direction:"


dir = gets
p dir

dir = dir.chomp
p dir
puts dir.class

if dir == "south"


	dungeongame.go(:south)

end

dir = dir.to_sym

p dir

newdir = gets

newdir = newdir.chomp
newdir = newdir.to_sym


dungeongame.go(newdir)

