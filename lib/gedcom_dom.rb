#gedcom_dom.rb
#GPLv2.1 or later
#Derived from Jamis Buck's gedcom/ruby sample code
#Also Copyright Josh Hansen

require "gedcom"

require "gedcom_record.rb"
require "individual.rb"
require "birth.rb"
require "death.rb"
require "ref.rb"
require "repo.rb"
require "address.rb"
require "source.rb"
require "family.rb"
require "marriage.rb"
require "set"

def debug (text)
	#puts text
end

class GedcomDOM < GEDCOM::Parser
	attr :individuals
	attr :repos
	attr :sources
	attr :families
	
	def initialize
		super
		
		setPreHandler	[ "FAM" ],			method( :init_family )
		setPreHandler	[ "FAM", "HUSB" ],		method( :reg_husband )
		setPreHandler	[ "FAM", "WIFE" ],		method( :reg_wife )
		setPreHandler	[ "FAM", "CHIL" ],		method( :reg_child )
		setPreHandler	[ "FAM", "MARR" ],		method( :init_marriage )
		setPreHandler	[ "FAM", "MARR", "DATE" ],	method( :reg_marr_date )
		setPreHandler	[ "FAM", "MARR", "PLAC" ],	method( :reg_marr_place )
		setPreHandler	[ "FAM", "MARR", "SOUR" ],	method( :reg_marr_source )
		setPostHandler	[ "FAM", "MARR" ],		method( :end_marriage )
		setPostHandler	[ "FAM" ],			method( :end_family )
		
		setPreHandler	[ "INDI" ],			method( :init_indiv )
		setPreHandler	[ "INDI", "SEX" ],		method( :reg_sex )
		setPreHandler	[ "INDI", "NAME", "GIVN" ],	method( :reg_given_names )
		setPreHandler	[ "INDI", "NAME", "SURN" ],	method( :reg_surname )
		setPreHandler	[ "INDI", "BIRT" ],		method( :init_birth )
		setPreHandler	[ "INDI", "BIRT", "DATE" ],	method( :reg_date )
		setPreHandler	[ "INDI", "BIRT", "PLAC" ],	method( :reg_place )
		setPreHandler	[ "INDI", "BIRT", "SOUR" ],	method( :reg_source_ref )
		setPostHandler	[ "INDI", "BIRT" ],		method( :end_event )
		setPreHandler	[ "INDI", "DEAT" ],		method( :init_death )
		setPreHandler	[ "INDI", "DEAT", "DATE" ],	method( :reg_date )
		setPreHandler	[ "INDI", "DEAT", "PLAC" ],	method( :reg_place )
		setPreHandler	[ "INDI", "DEAT", "SOUR" ],	method( :reg_source_ref )
		setPostHandler	[ "INDI", "DEAT" ],		method( :end_event )
		setPostHandler	[ "INDI" ],			method( :end_indiv )
		
		setPreHandler	[ "REPO" ],			method( :init_repo )
		setPreHandler	[ "REPO", "NAME" ],		method( :reg_repo_name )
		setPreHandler	[ "REPO", "ADDR" ],		method( :init_repo_addr )
		setPreHandler	[ "REPO", "ADDR", "CITY" ],	method( :reg_repo_addr_city )
		setPreHandler	[ "REPO", "ADDR", "STAE" ],	method( :reg_repo_addr_state )
		setPreHandler	[ "REPO", "ADDR", "POST" ],	method( :reg_repo_addr_post )
		setPreHandler	[ "REPO", "ADDR", "CTRY" ],	method( :reg_repo_addr_country )
		setPostHandler	[ "REPO", "ADDR" ],		method( :end_repo_addr )
		setPostHandler	[ "REPO" ],			method( :end_repo )
		
		setPreHandler	[ "SOUR" ],				method( :init_source )
		setPreHandler	[ "SOUR", "TITL" ],			method( :reg_sour_titl )
		setPreHandler	[ "SOUR", "AUTH" ],			method( :reg_sour_auth )
		setPreHandler	[ "SOUR", "CHAN" ],			method( :init_sour_chan )
		setPreHandler	[ "SOUR", "CHAN", "DATE" ],		method( :init_sour_chan_date )
		setPreHandler	[ "SOUR", "CHAN", "DATE", "TIME" ],	method( :reg_sour_chan_date_time )
		setPostHandler	[ "SOUR", "CHAN", "DATE" ],		method( :end_sour_chan_date )
		setPostHandler	[ "SOUR", "CHAN" ],			method( :end_sour_chan )
		setPostHandler	[ "SOUR" ],				method( :end_source )

		@individuals = Hash.new
		@repos = Hash.new
		@sources = Hash.new
		@families = Hash.new
		
		@cur_indiv = nil
		@cur_event = nil
		@cur_repo = nil
		@cur_addr = nil
		@cur_fam = nil
		
		@cur_source = nil
		@cur_change = nil
		@cur_date = nil
		@cur_marriage = nil
	end
	
	def init_indiv( data, state, parm )
		if(@cur_indiv == nil)
			@cur_indiv = Individual.new( data )
		else
			#
		end
	end
	def end_indiv( data, state, parm )
# 		#TODO Add some validation to make sure we add a legitimate individual
		if( ! @individuals.has_key?( @cur_indiv.tag ) )
			@individuals.store(@cur_indiv.tag, @cur_indiv)
		else
			#throw Exception.new
		end
		@cur_indiv = nil
	end
	
	def reg_given_names (data, state, parm)
		@cur_indiv.given_names = data if @cur_indiv.given_names == nil	#TODO do something if name is already set -- like throw an exception?
	end
	
	def reg_surname (data, state, parm)
		@cur_indiv.surname = data if @cur_indiv.surname == nil	#TODO do something if name is already set -- like throw an exception?
	end
	def reg_sex (data, state, parm)
		@cur_indiv.sex = data if @cur_indiv.sex == nil
	end

	def reg_date( data, state, parm )
		
		if (@cur_event.date == nil)
			d = GEDCOM::Date.safe_new( data )
			if d.is_date? and d.first.has_year? and d.first.has_month?
				@cur_event.date = d
			else
				#what?
			end
		else
			#?
		end
	end
	def reg_place( data, state, parm)
		if(@cur_event)
			@cur_event.place = data if @cur_event.place == nil
		else
			#throw some exception
		end
	end
	def reg_source_ref( data, state, parm )
		if(@cur_event)
			@cur_event.source_refs.add( Ref.new(data, @sources) )
		else
		
		end
		
	end
	
	def init_birth( data, state, parm )
		if(@cur_event == nil)
			#puts "Setting @cur_event"
			@cur_event = Birth.new
		else
			#throw Exception.new
			puts "ERROR"
		end
	end

	def init_death( data, state, parm )
		if(@cur_event == nil)
			#puts "Setting @cur_event"
			@cur_event = Death.new
		else
			#throw Exception.new
			puts "ERROR"
		end
	end

	def end_event( data, state, parm )
		if( ! @cur_indiv.events.has_key?(@cur_event.evt_type) )
			@cur_indiv.events.store(@cur_event.evt_type, @cur_event)
		else
			#throw Exception.new
		end
		@cur_event = nil
	end
	
	def init_repo( data, state, parm )
		if(@cur_repo == nil)
			@cur_repo = Repo.new( data )
		else
			#
		end
	end
	def end_repo( data, state, parm )
		if( ! @repos.has_key?(@cur_repo.tag) )
			@repos.store(@cur_repo.tag,@cur_repo)
		else
			#
		end
		@cur_repo = nil
	end

	
	def reg_repo_name( data, state, parm )
		if(@cur_repo)
			@cur_repo.name = data if @cur_repo.name == nil
		else
			#
		end
	end
	def init_repo_addr( data, state, parm )
		if(@cur_addr == nil)
			@cur_addr = Address.new( data )
		else
			#
		end
	end
	def reg_repo_addr_city( data, state, parm )
		if(@cur_addr)
			@cur_addr.city = data
		else
			#
		end
	end
	def reg_repo_addr_state( data, state, parm )
		if(@cur_addr)
			@cur_addr.state = data
		else
			#
		end
	end
	def reg_repo_addr_post( data, state, parm )
		if(@cur_addr)
			@cur_addr.post = data
		else
			#
		end
	end
	def reg_repo_addr_country( data, state, parm )
		if(@cur_addr)
			@cur_addr.country = data
		else
			#
		end
	end
	def end_repo_addr( data, state, parm )
		if(@cur_repo)
			@cur_repo.addr = @cur_addr if @cur_repo.addr == nil
		else
		
		end
		@cur_addr = nil
	end
	
	#Source
	def init_source( data, state, parm )
		@cur_source = Source.new data if @cur_source == nil
	end
	def reg_sour_titl( data, state, parm )
		if(@cur_source)
			@cur_source.title = data if @cur_source.title == nil
		else
		end
	end
	
	def reg_sour_auth( data, state, parm )
		if(@cur_source)
			@cur_source.author = data if @cur_source.author == nil
		else
		end
	end
	
	def init_sour_chan( data, state, parm )
		#If we add multiple CHAN support in the Source class then we'll use this to instantiate it
	end
	def init_sour_chan_date( data, state, parm )
		if(@cur_source)
			@cur_source.date = data if @cur_source.date == nil
		else
		end
	end
	def reg_sour_chan_date_time( data, state, parm )
		if(@cur_source)
			@cur_source.time = data if @cur_source.time == nil
		else
		end
	end
	
	def end_sour_chan_date( data, state, parm )
		#Nothing here
	end
	
	def end_sour_chan( data, state, parm )
		#Nor here
	end
	
	def end_source( data, state, parm )
		if( ! @sources.has_key?(@cur_source.tag) )
			@sources.store(@cur_source.tag,@cur_source)
		else
			#
		end
		@cur_source = nil
	end
	
	#Family
	def init_family( data, state, parm )
		@cur_fam = Family.new data if @cur_fam == nil
	end
	def end_family( data, state, parm )
		if(@cur_fam)
			if( ! @families.has_key?(@cur_fam.tag) )
				@families.store(@cur_fam.tag,@cur_fam)
			else
				#
			end
			@cur_fam = nil
		else
			#
		end
	end
	
	def init_marriage( data, state, parm )
		@cur_marriage = Marriage.new if @cur_marriage == nil
	end
	def reg_marr_date( data, state, parm )
		if(@cur_marriage)
			@cur_marriage.date = data if @cur_marriage.date == nil
		else
		end
	end
	def reg_marr_place( data, state, parm )
		if(@cur_marriage)
			@cur_marriage.place = data if @cur_marriage.place == nil
		else
		end
	end
	def reg_marr_source( data, state, parm )
		if(@cur_marriage)
			@cur_marriage.source_refs.add( Ref.new(data, @sources) ) #if @cur_marriage.source_refs.include ...
		else
		end
	end
	def end_marriage( data, state, parm )
		if( @cur_fam )
			if( ! @cur_fam.events.include?(@cur_marriage) )
				@cur_fam.events.add(@cur_marriage)
			else
				#
			end
			@cur_fam = nil
		end
	end
	def reg_husband( data, state, parm )
		if( @cur_fam )
			@cur_fam.husband = Ref.new( data, @individuals ) if @cur_fam.husband == nil
		else
		end
	end
	def reg_wife( data, state, parm )
		if( @cur_fam )
			@cur_fam.wife = Ref.new( data, @individuals )  if @cur_fam.wife == nil
		else
		end
	end
	def reg_child( data, state, parm )
		if( @cur_fam )
			@cur_fam.children.add( Ref.new( data, @individuals )  )
		else
		end
	end
end