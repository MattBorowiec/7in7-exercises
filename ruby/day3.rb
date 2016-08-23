require 'csv'

module ActAsCsv
	def self.included(base)
		base.extend ClassMethods
	end
	
	module ClassMethods
		def act_as_csv
			include InstanceMethods
		end
	end

	module InstanceMethods
		def read
			@csv_contents = []
			filename = self.class.to_s.downcase + '.txt'
			file = File.new(filename)
			@headers = file.gets.chomp.split(', ')

			file.each do |row| 
				@csv_contents << row.chomp.split(', ')
			end
		end

		attr_accessor :headers, :csv_contents
		def initialize
			read
		end

		def each
			@csv_contents.each do |row|
				yield CSV::Row.new(@headers, row)
			end
		end
	end
end

class CSV
	class Row	
		def method_missing(name, *args, &block)
			puts self.field(name.to_s)
		end
	end
end

class RubyCsv
	include ActAsCsv
	act_as_csv
end

m = RubyCsv.new
puts "Headers: #{ m.headers.inspect}"
puts "Body: #{m.csv_contents.inspect}"
puts
puts "exercise output for row.one: "
m.each {|row| puts row.one}
puts
puts "exercise output for row.two: "
m.each {|row| puts row.two}
puts "exercise output for row.three" 
m.each {|row| puts row.three}
