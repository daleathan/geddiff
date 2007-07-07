#family.rb
#License: LGPLv2.1 or later
#Copyright: Josh Hansen
require "gedcom_record.rb"
require "set.rb"

class Family < GedcomRecord
	attr_accessor :events, :refn, :husband, :wife, :children
	
	def initialize( id )
		super(id)
		
		@refn = nil
		@husband = nil
		@wife = nil
		@children = Set.new
		@events = Set.new
	end
	def to_s
		s = "Family: #{@tag}\n"
		if(@husband)
			s += "\tHusband:	#{@husband}\n"
		end
		if(@wife)
			s += "\tWife:		#{@wife}\n"
		end
		@events.each {|event|
			s += "\tEvent:		#{event}\n"
		}
		@children.each {|child|
			s += "\tChild:		#{child}\n"
		}
		return s
	end
end