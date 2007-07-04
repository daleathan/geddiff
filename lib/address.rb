#address.rb
#GPLv2.1 or later
#Copyright: Josh Hansen

class Address
	attr_accessor :street, :city, :state, :post, :country
	def initialize( street )
		@street = street
		@city = nil
		@state = nil
		@post = nil
		@country = nil
	end
	def to_s
		return "\t#{@street}\t\n#{@city}, #{@state} #{@country}\n"
	end
end