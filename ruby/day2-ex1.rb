a = (1..16).to_a

values = Array.new
a.each do |i|
	values.push(i)
	if values.length == 4
		puts values
		puts "-----"
		values.clear
	end
end
