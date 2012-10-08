class Zombie < ActiveRecord::Base
  attr_accessible :graveyard, :motto, :name
	validates :name, :presence=>true, :uniqueness=>true
end
