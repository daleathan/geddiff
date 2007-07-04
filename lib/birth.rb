#birth.rb
#GPLv2.1 or later
#Copyright: Josh Hansen

require "event.rb"

class Birth < Event
	def initialize
		super
		@evt_type = "birth"
	end
end