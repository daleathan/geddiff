#indiv_ref.rb
#GPLv2.1 or later
#Copyright: Josh Hansen
require "ref.rb"

class IndivRef < Ref
	@@individuals = nil
	def initialize( ref_string )
		super(ref_string)
		
		
	end
	
	#Dereference the reference; returns the object pointed to; cache the resulting object in @resolved_obj;
	def lookup(individuals = nil)
		if(@resolved_obj)
			return @resolved_obj
		else
			if(@@individuals)
				return @@individuals[ref_string]
			else
				if(individuals)
					@@individuals = individuals	#Cache the "individuals"
					return individuals[ref_string]
				else
					#
				end
			end
		end
	end
	
	def set_individuals(individuals)
		if(@@individuals == nil)
			@@individuals = individuals
		end
	end
	
	def to_s
		
	end
end