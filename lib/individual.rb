#individual.rb
#License: LGPLv2.1 or later
#Copyright: Josh Hansen
require "gedcom_record.rb"

class Individual < GedcomRecord
	attr_accessor :given_names, :surname, :sex, :events, :famc_refs, :fams_refs
	
	def initialize(id)
		super(id)
		
		@famc_refs	= Set.new	#In which families am I a child?
		@fams_refs	= Set.new	#In which families am I a spouse?
		@events		= Hash.new
		@given_names	= nil
		@surname	= nil
		@sex		= nil
		
	end
	
	def to_s
		s = "Individual\n"
		s += "\tName: #{@given_names} #{@surname}"
		s += "\tsex: #{@sex}" if @sex
		
		@famc_refs.each {|famc|
			s += "\n\tFAMC #{famc}"
		}
		
		@famc_refs.each {|fams|
			s += "\n\tFAMS #{fams}"
		}
		
		@events.each_value {|event|
			s += "\n\t*" + event.to_s
		}
		
		return s
	end
	
	#Compare this individual to another one, outputing any differences?
	def diff( other )
		
	end
end