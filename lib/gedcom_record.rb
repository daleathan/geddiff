#gedcom_record.rb
#License: LGPLv2.1 or later
#Copyright: Josh Hansen

class GedcomRecord
	attr_accessor :tag
	def initialize( tag )
		@tag = tag
	end
end