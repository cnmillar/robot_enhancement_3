require_relative 'spec_helper'

#The Robot class should keep track of all robots that are instantiated.

describe Robot do
	describe "all_robots" do
		it "should initialize to an empty array if no robots" do
			expect(Robot.all_robots).to be_empty
		end

		it "contains both robot1 and robot2" do
			@robot1 = Robot.new
			@robot2 = Robot.new
			expect(Robot.all_robots).to eq([@robot1, @robot2])
		end
	end
end