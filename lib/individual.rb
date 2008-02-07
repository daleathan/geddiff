#individual.rb
#License: LGPLv2.1 or later
#Copyright: Josh Hansen
require "gedcom_record.rb"
require 'diff/lcs'
class Individual < GedcomRecord
	attr_accessor :given_names, :surname, :sex, :events, :famc_refs, :fams_refs
	
	def initialize(id)
		super(id)
		
		@famc_refs	= SortedSet.new	#In which families am I a child?
		@fams_refs	= SortedSet.new	#In which families am I a spouse?
		@events		= Hash.new
		@given_names	= ""
		@surname	= ""
		@sex		= ""
	end
	
	def to_s
		s = "Individual #{tag}\n"
		s += "\tName: #{@given_names} #{@surname}"
		s += "\tsex: #{@sex}" if @sex
		
		@famc_refs.each {|famc|
			s += "\n\tFAMC #{famc}"
		}
		
		@famc_refs.each {|fams|
			s += "\n\tFAMS #{fams}"
		}
		
		@events.each_value {|event|
			s += "\n\t*" + event.to_s
		}
		
		return s
	end
	
        def famc_s
                s = ""
                @famc_refs.each {|famc|
			s += "\n#{famc}"
		}
                return s
        end
        
        def fams_s
                s = ""
                @fams_refs.each {|fams|
			s += "\n#{fams}"
		}
                return s
        end
        
	def diff_strings(str1, str2)
		seq1 = str1.to_s.split("")
		seq2 = str2.to_s.split("")
 		diffs = Diff::LCS.diff(seq1, seq2)
                return diffs
	end
	
	def diff_hashes(hash1, hash2)
                result = []
                if(hash1 != nil)
                        hash1.each_key{|key|
                                val1 = hash1[key]
                                val2 = hash2[key]
                                val1 = "" if val1 == nil
                                val2 = "" if val2 == nil
                                result += diff_strings(val1, val2)
                        }
                end
                if(hash2 != nil)
                        hash2.keys.each{|key|
                                val1 = hash1[key] if hash1 != nil
                                val2 = hash2[key]
                                val1 = "" if val1 == nil
                                val2 = "" if val2 == nil
                                result += diff_strings(val1, val2)
                        }
                end
                return result
	end
	
	#Compare this individual to another one, outputing any differences?
	def diff( other )
                result = []
		result += diff_strings(@given_names, other.given_names)
		result += diff_strings(@surname, other.surname)
		result += diff_strings(@sex, other.sex)

		(@events.keys + other.events.keys).each{|key|
                        val1 = @events[key]
                        val2 = other.events[key]
                        
                        if val1 != nil
                                hash1 = val1.to_hash
                        else
                                hash1 = nil
                        end
                        if val2 != nil
                                hash2 = val2.to_hash
                        else
                                hash2 = nil
                        end
                        result += diff_hashes(hash1, hash2)
                }
                
                result += diff_strings(famc_s, other.famc_s)
                result += diff_strings(fams_s, other.fams_s)
                return result.flatten
	end
#        
#        include Comparable
#        
#        def ==(other)
#                puts "individual::=="
#                r = r && (self.surname == other.surname)
#                r = r && (self.given_names == other.given_names)
#                r = r && (self.sex == other.sex)
#                
#                (0..@famc_refs.size).each {|i|
#                        r = r && (self.famc_refs.to_a[i] == other.famc_refs.to_a[i])
#                }
#
#                (0..@fams_refs.size).each {|i|
#                        r = r && (self.fams_refs.to_a[i] == other.fams_refs.to_a[i])
#                }
#                
#                @events.each_key {|key|
#                        r = r && (self.events[key] == other.events[key])
#                }
#                puts "individual::/=="
#                return r
#          end
#
          def <=>(other)
                puts "individual::<=>"
                if(self.surname != nil)
                  r = self.surname <=> other.surname
                else
                  r = "" <=> other.surname
                end
                
                puts "given_names"
                val1 = self.given_names
                val2 = other.given_names if other != nil
                val1 = "" if val1 == nil
                val2 = "" if val2 == nil
                r = val1 <=> val2 if r.zero?
                
                puts "sex"
#                r = self.sex <=> other.sex if r.zero?
                val1 = self.sex
                val2 = other.sex if other != nil
                val1 = "" if val1 == nil
                val2 = "" if val2 == nil
                r = val1 <=> val2 if r.zero?
                
#                puts "famc"
#                (0..@famc_refs.size).each {|i|
#                        puts "\tfamc:#{i}"
#                        val1 = self.famc_refs.to_a[i]
#                        puts "\tval2"
#                        val2 = other.famc_refs.to_a[i] if other != nil
#                        puts "\tval1 clean"
#                        val1 = "" if val1 == nil
#                        puts "\tval2 clean"
#                        val2 = "" if val2 == nil
#                        puts "\tcompare"
#                        r = val1 <=> val2 if r.zero?
#                }
#
#                puts "fams"
#                (0..@fams_refs.size).each {|i|
#                        puts "fams:#{i}"
#                        val1 = self.fams_refs.to_a[i]
#                        val2 = other.fams_refs.to_a[i] if other != nil
#                        val1 = "" if val1 == nil
#                        val2 = "" if val2 == nil
#                        r = val1 <=> val2 if r.zero?
#                }
#                
#                puts "events"
#                @events.each_key {|key|
#                        puts "events:#{key}"
#                        r = self.events[key] <=> other.events[key] if r.zero?
#                }

                return r
          end
end