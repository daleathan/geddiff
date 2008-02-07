#gedcom_record.rb
#License: LGPLv2.1 or later
#Copyright: Josh Hansen

class GedcomRecord
	attr_accessor :tag
	def initialize( tag )
		@tag = tag
	end
        
        include Comparable
        def <=>(other)
                return @tag <=> other.tag
        end
        
        def ==(other)
                if(other == nil)
                        return @tag == ""
                else
                        return @tag == other.tag
                end
                
        end
end