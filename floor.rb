# Floor class stores a queue of Persons waiting to get on the elevator

class Floor
	def initialize floor_number, elevators, persons_queue
		@floor_number = floor_number
		@elevators = elevators
		@persons_queue = persons_queue
	end

	# A better elevator algorithm can be made by changing this Floor.call_elevator and Elevator.next_floor_to_visit
	def call_elevator elevator_number=0
		@elevators[elevator_number].add_to_floors_to_visit @floor_number
	end

	def add_person person
		@persons_queue.push person
		call_elevator
	end

	# adds Persons to the Elevator at this Floor
	def step
		@elevators.each do |elevator|
			if elevator.current_floor == @floor_number
				while !@persons_queue.empty?
					if elevator.number_of_occupants < elevator.max_capacity
						elevator.add_occupant @persons_queue.shift
					else
						break
					end
				end
			end
		end
	end

	def to_s
		"Floor #{@floor_number}:\n\t\tNumber of people in queue: #{@persons_queue.size}"
	end
end