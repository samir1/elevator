#Elevator Assignment
sim.rb runs the Simulation. sim.rb creates a building and adds people to the building. Simulation.run(n) runs Simulation.clock_tick n times. Simulation.clock_tick steps the instance of the building. Each step of the building steps instances of Floor and Elevator. In each step of Floor, the instances of Person enter an elevator if there is an elevator at the floor. In each step of Elevator, it moves to a different floor and unloads people if it can. The elevator moves to floors that are in the queue of floors to visit. If there are no floors to visit, the elevator travels to the bottom floor.

[![Code Climate](https://codeclimate.com/github/samir1/elevator/badges/gpa.svg)](https://codeclimate.com/github/samir1/elevator)
