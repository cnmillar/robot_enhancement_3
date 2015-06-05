require_relative 'spec_helper'

#The Robot class can be asked to return all robots in a given position (x,y). It should return an array of all 
# the robots since multiple robots could potentially be at position 0,0 (for example)

describe Robot do
	describe ".in_position" do

		before :each do
			@robot1 = Robot.new
			@robot2 = Robot.new
		end

		it "finds all robots with coordinates [0,0]" do
			expect(Robot.in_position([0,0])).to eq([@robot1, @robot2])
		end

		it "finds all robots with coordinates [0,1]" do
			@robot1.move_up
			expect(Robot.in_position([0,1])).to eq([@robot1])
		end
	end
end