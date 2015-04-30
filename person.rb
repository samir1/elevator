# Person class stores a starting_floor and a destination_floor

class Person
	attr_reader :starting_floor, :destination_floor

	def initialize current_floor, destination_floor
		@starting_floor = current_floor
		@destination_floor = destination_floor
	end

	# to_s for person is not necessary

end