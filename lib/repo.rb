#repo.rb
#License: LGPLv2.1 or later
#Copyright: Josh Hansen

require "gedcom_record.rb"

class Repo < GedcomRecord
	attr_accessor :name, :addr
	def initialize( id )
		super(id)
		@name = nil
		@addr = nil
	end
	def to_s
		return "Repository: #{@name}\n\tAddress: #{@addr}"
	end
end