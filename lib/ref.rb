#ref.rb
#License: LGPLv2.1 or later
#Copyright: Josh Hansen
#Holds a reference to later be resolved to some sort of GedcomRecord

class Ref
	attr_reader :ref_string
	
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
	def to_deref_s
		return lookup().to_s
	end
	def to_s
		return "Reference:\t#{@ref_string}"
	end
        
        include Comparable
        def ==(other)
                val1 = self.ref_string
                val2 = other.ref_string if other != nil
                val1 = "" if val1 == nil
                val2 = "" if val2 == nil
                
                return val1 == val2
        end

        def <=>(other)
                val1 = self.ref_string
                val2 = other.ref_string if other != nil
                val1 = "" if val1 == nil
                val2 = "" if val2 == nil
                
                return val1 <=> val2
        end
end