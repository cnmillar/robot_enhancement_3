require_relative 'spec_helper'

describe Robot do

	before :each do
		@robot = Robot.new
	end

	describe "#heal!" do
		it "should raise an exception if the robot is already at 0 health or less" do
			@robot.health = 0
			expect{@robot.heal!(5)}.to raise_error(RobotAlreadyDeadError)
		end
	end	

	describe "#attack!" do
		it "should raise an exception if the robot tries to attack an item" do
			item = Item.new("an_item", 25)
			expect{@robot.attack!(item)}.to raise_error(UnattackableEnemy) # expect needs to be a block since it doesn't return anything
		end
	end
end
