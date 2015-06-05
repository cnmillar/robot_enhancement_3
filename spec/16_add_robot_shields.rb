require_relative 'spec_helper'

# Robots can start with 50 shield points. When the robot is damaged it first drains the shield and then starts 
# affecting actual health.

# You will likely also have to fix previous tests that will fail due to this enhancement. However, focus on 
# running spec 16 until you are done, then rerun all your tests to find other failing tests and modify the tests 
# to modify their expectations.

describe Robot do

	before :each do
		@robot = Robot.new
	end

	describe "#initialize" do
		it "should initialize shield to 50" do
			expect(@robot.shield).to eq(50)
		end
	end

	describe "#wound" do
		it "should take on damage to shield and not health" do
			@robot.wound(5)
			expect(@robot.shield).to eq(45)
		end

		it "should take on damage to health when shield is zero" do
			allow(@robot).to receive(:shield).and_return(0)
			@robot.wound(5)
			expect(@robot.health).to eq(95)
		end

		it "shield should never be less than zero" do
			@robot.wound(60)
			expect(@robot.shield).to eq(0)
		end

		it "health should take the remainder of damage once shield is zero" do
			@robot.wound(60)
			expect(@robot.health).to eq(90)
		end
	end
end