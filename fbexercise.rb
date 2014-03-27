
#puts "Enter number of terms"
#terms = gets.chomp
#p terms
#p terms.class
#itt = terms.to_i
#if itt < 3
#	puts 'Warning: At least 2 terms are required'

#end
itt = 1
until itt >= 2
	puts "\nEnter number of terms: \n"
	terms = gets.chomp
	itt = terms.to_i
	if itt < 0
		puts "Warning: number of terms cannot be negative"
	end
	if itt < 2
		puts "Warning: At least two unique terms are needed"
	end
	if itt/1 == 0
		
	
	puts "Input must be in form of a number like '3' or '10' "
end
end

p itt

#getnums = []
#until getnums.length >= 2
#	puts "Enter numbers in arithmetic sequence separated by single space"
#	getnums = gets.chomp
#	itt = terms.to_i
#	if itt < 0
#		puts "Warning: number of terms cannot be negative"
#	end
#	if itt < 2
#		puts "Warning: At least two terms are needed"
#	end
#end


# method to create testarray for comparison purposes
#testarray = []
#until testarray.length == itt
#	testarray.push(1)
#end

# MINOR I/O debugging

getnumsnew = []
until getnumsnew.length == itt && (getnumsnew.length == getnumsnew.uniq.length)

	puts "\nEnter terms of arithmetic sequence separated by single space: \n"
	getnums = gets.chomp
	getnums = getnums.downcase;


	getnumsnew = getnums.split(/\s+/)
	


	lengthcheck = getnumsnew.length
	uniqlength = getnumsnew.uniq.length


# code to prevent faulty user submissions

	if getnumsnew.include?("0") || getnumsnew.include?("zero")
	getnumsnew = getnumsnew.collect{|word| word.to_i } 
	getnumsnew = getnumsnew.uniq


		if uniqlength != lengthcheck
		puts "\nWARNING: CANNOT HAVE DUPLICATE ELEMENTS"
		end

	else
		getnumsnew = getnumsnew.collect{|word| word.to_i}
		getnumsnew = getnumsnew.delete_if{|i| i==0}

		if uniqlength != lengthcheck
			puts "\nWARNING: CANNOT HAVE STRINGS IN INPUT"
		end
	end	



	if getnumsnew.length != itt
		puts "\nYOU DONE FUCKED UP SON, wrong number of terms please try again!!"
	end
end


puts "\nYour sorted numbers are:"
qq = getnumsnew.sort
p qq

# now to determine missing number in sequence
# by definition, in arithmetic sequence all points are same distance apart
# one can use find this distance based on the range

range = qq.last - qq.first
puts "\nrange of elemnts:"
p range

step = range/(getnumsnew.length)
puts "\nstep size"
p step



# multiply the step by 1...2...3...4 for future comparison to determine missing spot

interatorq = 0
ansfinder = []
until ansfinder.length == qq.length+1
	ansfinder.push((step*interatorq)+qq[0])
	interatorq +=1
end

p ansfinder





finalsolution = ansfinder - qq

if finalsolution.length == 1

puts "\n This is the MISSING number in the sequence:"
p finalsolution[0]

finalseq = finalsolution + qq
finalseq = finalseq.sort

puts "\n And this is what the final sequence should look like:"
puts finalseq


elsif finalsolution.length != 1

	4.times do
	puts "\n ERROR: sequence is not arithmetic!!"
	end

end



