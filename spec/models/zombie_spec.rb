require 'spec_helper'

describe Zombie do
	it "should have a name" do
		subject.name = "Bob"
		subject.name.should == "Bob"
	end
	it "should have a graveyard" do
		subject.graveyard = "Shady Oaks"
		subject.graveyard.should == "Shady Oaks"
	end
	it "should validate that the name is present" do
		subject.should_not be_valid
		subject.errors[:name].first.should == "can't be blank"
		subject.name="Ash"
		subject.should be_valid
	end
	it "should validate that the name is unique" do
		subject.name="Bob"
		subject.save!
		dupe = Zombie.new(:name=>"Bob")
		dupe.should_not be_valid
		dupe.errors[:name].first.should == "has already been taken"
		dupe.name="Carol"
		dupe.should be_valid
	end
end
