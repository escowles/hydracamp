require 'spec_helper'

describe ZombiesController do
	describe "#new" do
		it "should set a template zombie" do
			get :new
			response.should be_successful
			assigns[:zombie].should be_kind_of Zombie
		end
	end

	describe "#create" do
		before do
			@count = Zombie.count
		end
		it "should create a zombie" do
			post :create, :zombie=>{:name=>"Bob", :graveyard=>"Shady Oaks"}
			response.should redirect_to zombies_path
			Zombie.count.should == @count + 1
			flash[:notice].should == "Added Zombie"
		end
	end

	describe "#index" do
		before do
			@bob = Zombie.create(:name=>"Bob")
			@carol = Zombie.create(:name=>"Carol")
		end
		it "should list all zombies" do
			get :index
			response.should be_successful
			assigns[:zombies].should == [@bob,@carol]
		end
	end

	describe "#show" do
		before do
			@zombie = Zombie.create(:name=>"Bob")
		end
		it "should show details for a zombie" do
			get :show
			response.should be_successful
			assigns[:zombies].should == [@zombie]
		end
	end

	describe "#destroy" do
		before do
			@count = Zombie.count
		end
		it "should remove a zombie" do
			post :destroy, :zombie=>{:name=>"Bob", :graveyard=>"Shady Oaks"}
			response.should redirect_to zombies_path
			Zombie.count.should == @count - 1
			flash[:notice].should == "Deleted Zombie"
		end
	end
end
