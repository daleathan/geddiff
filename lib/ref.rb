#ref.rb
#GPLv2.1 or later
#Copyright: Josh Hansen
#Holds a reference to later be resolved to some sort of GedcomRecord

class Ref
	attr_accessor :ref_string
	
	def initialize( ref_string, collection )
		@ref_string = ref_string
		@collection = collection	#The place to look up a reference
		@resolved_obj = nil
	end
	
	#Dereference the reference; returns the object pointed to; cache the resulting object in @resolved_obj;
	def lookup
		if(@resolved_obj)	#Return the cached object if we've already done this lookup
			return @resolved_obj
		else
			return @resolved_obj = @collection[ref_string]
		end
	end
	def to_s
		return @collection[@ref_string].to_s
	end
end