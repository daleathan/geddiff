#event.rb
#License: LGPLv2.1 or later
#Copyright: Josh Hansen

class Event
	attr_accessor :evt_type, :date, :place, :source_refs
	def initialize( type )
		@source_refs = Set.new
		@evt_type = type
		@date = nil
		@place = nil
	end
	def to_s
		r = "Event:"
		r += "\n\ttype: #{@evt_type}"
		r += "\n\tdate: #{@date}" if @date
		r += "\n\tplace: #{@place}\n" if @place
                
		source_refs.each {|ref|
			r += "\tsrc_ref:" + ref.to_s
		}
		return r
	end
	
	def to_hash
		hash = Hash.new
		hash.store("type", @evt_type)
		hash.store("date", @date)
		hash.store("place", @place)
		
		ref_num = 1
		source_refs.each {|ref|
			hash.store("src_ref#{ref_num}", ref)
			ref_num += 1
		}
                return hash
	end
end