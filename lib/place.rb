#place.rb
#License: LGPLv2.1 or later
#Copyright: Josh Hansen

class Place
	attr_accessor :name
	def initialize
		@name = nil
	end
	def initialize(name)
		@name = name
	end
end