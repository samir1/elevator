# Elevator takes Persons from Floor to Floor

class Elevator
	def initialize elevator_number, top_floor
		@ELEV_MAX_PERSONS = 10
		@ELEV_RESTING_FLOOR = 0
		@elevator_number = elevator_number
		@direction_of_travel = :stationary
		@current_floor = 0
		@elevator_occupants = Array.new
		@floors_to_visit = Array.new
		@top_floor = top_floor
	end

	def max_capacity
		@ELEV_MAX_PERSONS
	end

	def number_of_occupants
		@elevator_occupants.size
	end

	def current_floor
		@current_floor
	end

	def add_to_floors_to_visit floor
		@floors_to_visit.push floor
	end

	def direction_of_travel
		@direction_of_travel
	end

	def direct_button floor
		@floors_to_visit.push floor
	end

	def set_direction_of_travel_to direction
		@direction_of_travel = direction
	end

	def add_occupant person
		@elevator_occupants.push person
		@floors_to_visit.push person.destination_floor
		puts "Person (#{person}) got on at floor #{@current_floor} and wants to get off at floor #{person.destination_floor}"
	end

	def remove_occupant person
		@elevator_occupants.delete person
		puts "Person (#{person}) got off at floor #{@current_floor}"
	end

	def arrive_at_a_new_floor
		@floors_to_visit.delete @current_floor
		
		# switch directions if necessary
		if @current_floor == @top_floor && !@floors_to_visit.empty?
			direction_of_travel = :down
		elsif @current_floor == 0 && !@floors_to_visit.empty?
			direction_of_travel = :up
		end
		
		# drop off people
		if !@elevator_occupants.empty?
			@elevator_occupants.each do |person|
				if person.destination_floor == @current_floor
					remove_occupant person
				end
			end
		end
	end

	def step
		@current_floor = next_floor_to_visit
		arrive_at_a_new_floor
	end

	def next_floor_to_visit
		if @floors_to_visit.empty? && @current_floor == @ELEV_RESTING_FLOOR
			@direction_of_travel = :stationary
			return @ELEV_RESTING_FLOOR

		elsif @floors_to_visit.empty?
			next_floor = 0
			if @current_floor > @ELEV_RESTING_FLOOR
				@direction_of_travel = :down
				next_floor = @current_floor - 1
			elsif @current_floor < @ELEV_RESTING_FLOOR
				@direction_of_travel = :up
				next_floor = @current_floor + 1
			end
			@floors_to_visit.push next_floor
			return next_floor

		elsif @direction_of_travel == :up
			next_floor = @top_floor
			@floors_to_visit.each do |floor|
				if floor < @top_floor
					next_floor = floor
				end
			end
			return next_floor

		elsif @direction_of_travel == :down
			next_floor = 0
			@floors_to_visit.each do |floor|
				if floor > @top_floor
					next_floor = floor
				end
			end
			return next_floor

		elsif !@floors_to_visit.empty?
			next_floor = @floors_to_visit[0]
			if next_floor > @current_floor
				direction_of_travel = :up 
				return @current_floor + 1 if @current_floor < @top_floor
			else
				direction_of_travel = :down
				return @current_floor - 1 if @current_floor > 0
			end
		end

		return @ELEV_RESTING_FLOOR
	end

	def to_s
		"Elevator #{@elevator_number}:\n\t\tCurrent floor: #{@current_floor}\n\t\tNext floor: #{next_floor_to_visit}\n\t\tElevator occupancy: #{number_of_occupants.to_s}/#{max_capacity.to_s}"
	end

end