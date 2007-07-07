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
		r += "\ttype: #{@evt_type}"
		r += "\tdate: #{@date}" if @date
		r += "\tdate: #{@date}" if @place
		source_refs.each {|ref|
			r += "\t" + ref.to_s
		}
		return r
	end
end