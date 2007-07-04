#event.rb
#GPLv2.1 or later
#Copyright: Josh Hansen

class Event
	attr_accessor :evt_type, :date, :place, :source_refs
	def initialize
		@evt_type = nil
		@date = nil
		@place = nil
		@source_refs = Set.new
	end
	def to_s
		r = "#{@evt_type}:\tdate=#{@date}\tplace=#{@place}\n"
		source_refs.each {|ref|
			r += "\t" + ref.to_s
		}
		return r
	end
end