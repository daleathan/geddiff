#death.rb
#GPLv2.1 or later
#Copyright: Josh Hansen

require "event.rb"

class Death < Event
	def initialize
		super
		@evt_type = "death"
	end
end