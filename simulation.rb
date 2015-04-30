# Simulation class keeps track of time and runs Building.step

class Simulation

	def initialize 
		@time = 0
		@domain_model_instnaces = Array.new
	end

	def clock_tick
		@time = @time + 1
		@domain_model_instnaces.each do |domain_model_instnace|
			if domain_model_instnace.is_a? Building
				domain_model_instnace.step
				puts domain_model_instnace.to_s
				puts
				puts
			end
		end
	end

	def run n
		puts "Initial setup:"
		@domain_model_instnaces.each do |domain_model_instnace|
			if domain_model_instnace.is_a? Building
				 puts domain_model_instnace.to_s
			end
		end
		puts
		puts
		for i in 0...n
			puts "-----------------------------"
			puts "Current tick: #{i}"
			clock_tick
			sleep 1
		end
	end

	# Simulation.register is not necessary because Building keeps track of Persons, Floors, and Elevators
	# Added this method because it's in the instructions
	# Without this, I would just have a variable to keep track of the Building
	def register domain_model_instnace
		@domain_model_instnaces.push domain_model_instnace
	end
end