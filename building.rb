# Building class stores all elevators and floors
# Persons are added to buildings using add_person
# Building.step runs Floor.step and Elevator.step

class Building
	attr_accessor :elevators, :floors

	def initialize number_of_floors, number_of_elevators
		@elevators = Array.new
		@floors = Array.new
		for i in 0...number_of_elevators
			@elevators.push Elevator.new i, number_of_floors-1
		end
		for i in 0...number_of_floors
			@floors.push Floor.new i, @elevators, Array.new
		end
	end

	def add_person person
		@floors[person.starting_floor].add_person person
	end

	def step
		@floors.each { |floor| floor.step if floor.is_a? Floor }
		@elevators.each { |elevator| elevator.step if elevator.is_a? Elevator }
	end

	def to_s
		s = ""
		s += "Building:"
		s += "\n\tFloors:\n"
		@floors.each do |floor|
			s += "\t\t#{floor.to_s}\n"
		end
		s += "\n\tElevators:"
		@elevators.each do |elevator|
			s += "\n\t\t#{elevator.to_s}\n"
		end
		s
	end
end