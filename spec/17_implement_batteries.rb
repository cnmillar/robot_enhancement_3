require_relative 'spec_helper'

# Batteries are items that can be used by robot to recharge its shield. Implement Battery item that can 
# be used to recharge the Robot’s shield. Batteries have a weight of 25.

describe Batteries do

	before :each do
		@battery = Batteries.new
	end

	describe "#initialize" do

		it "initializes name to 'battery'" do
			expect(@battery.name).to eq("Battery")
		end

		it "initializes weight to 25" do
			expect(@battery.weight).to eq(25) 
		end

		it "is an item" do
			expect(@battery.is_a? Item).to be_truthy
		end
	end

	describe "#recharge" do

		it "recharge robot instance" do
			@robot = Robot.new
			allow(@robot).to receive(:shield).and_return(20)
			expect(@battery.recharge(@robot)).to eq(50)
		end
	end
end

describe Robot do

	before :each do
		@robot = Robot.new
		@battery = Batteries.new
	end	

	describe "#pick_up" do
		it "if shield <= 25, when battery is picked up, recharge shield" do
			@robot.shield = 20
			@robot.pick_up(@battery)
			@robot.shield = 50
		end

		it "if shield = 30, then stash battery in items for later use" do
			@robot.pick_up(@battery)
			expect(@robot.items).to include @battery
		end
	end
end