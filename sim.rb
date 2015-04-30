load './person.rb'
load './elevator.rb'
load './floor.rb'
load './building.rb'
load './simulation.rb'


person = Person.new 0, 2
person2 = Person.new 0, 4
building = Building.new 5, 1
sim = Simulation.new
sim.register building
sim.register person
sim.register person2
building.add_person person
building.add_person person2
sim.run 6

# creates a building and adds two people to it