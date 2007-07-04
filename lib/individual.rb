#individual.rb
#GPLv2.1 or later
#Copyright: Josh Hansen
require "gedcom_record.rb"

class Individual < GedcomRecord
	attr_accessor :given_names, :surname, :sex, :events
	
	def initialize(id)
		super(id)
		
		@given_names	= nil
		@surname	= nil
		@sex		= nil
		@events		= Hash.new
		@famc		= nil
	end
	
	def to_s
		return "Individual #{@id}\tName: #{@given_names} #{@surname}\tsex: #{@sex}" +
			"\n\t#{@events["birth"]}" +
			"\n\t#{@events["death"]}"
	end
end