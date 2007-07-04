#marriage.rb
#GPLv2.1 or later
#Copyright: Josh Hansen

require "event.rb"

class Marriage < Event
	def initialize
		super
		@evt_type = "marriage"
	end
end