#source.rb
#GPLv2.1 or later
#Copyright: Josh Hansen
require "gedcom_record.rb"

class Source < GedcomRecord
	attr_accessor :title, :author, :date, :time
	def initialize(id)
		super(id)
		
		#TODO Add support for multiple CHAN tags??? Is this supported by the standard?
		#TODO Use Ruby's DateTime class?
		@title = nil
		@author = nil
		@date = nil
		@time = nil
	end
	def to_s
		s = "Source: #{@title}"
		if(@author)
			s =  " by #{@author}"
		end
		if(@time)
			s += " at #{@time}"
		end
		if(@date)
			s += " on #{@date}"
		end
		return s
	end
end