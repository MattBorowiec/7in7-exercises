File.open('file.txt', 'r') do |f| 
	f.each_line do |line|
		puts "#{$.}. #{line}" if line.match(ARGV[0])
	end
end
