class Calendar 

	#attr_accessor :mymeals
	#attr_accessor :calarray

	#def initialize(meals)
		#@mymeals = meals
		#@calarray = makeCal(@mymeals)
	#end

	def makeCal (m)
		puts ("here")
	  	dayplan = Array.new
	  	calendar = Array.new
	  	count = 0

	  	while count < m.length
	  		index = count
	  		3.times do
	  				mymeal = m.at(index)
	  				dayplan.push(mymeal)
	  				index += 1
	  		end

	  			calendar.push(dayplan)
	  			#calarray.push(dayplan)
	  		count += 3
	  	end

	  	return calendar
	 
	 end

end