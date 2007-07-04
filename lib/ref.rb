#ref.rb
#GPLv2.1 or later
#Copyright: Josh Hansen
#Holds a reference to later be resolved to some sort of GedcomRecord

class Ref
	attr_accessor :ref_string

	def initialize( ref_string )
		@ref_string = ref_string
		@resolved_obj = nil
	end
	def to_s
		return "ref: #{@ref_string}"
	end
end