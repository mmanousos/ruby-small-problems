=begin
Make an OrangeTree class that has a height method that returns its height and a one_year_passes method that,
when called, ages the tree one year. Each year the tree grows taller (by however much we determine), and after
some number of years (up to you) the tree should die. For the first few years, the tree should not produce fruit,
but after a while it should. And that bounty should be more each subsequent year. Should be able to count_the_oranges
(returns number of all oranges on the tree) and pick_an_orange (reduces count_the_oranges by 1 and returns a string
describing how delicious the orange was, or that there are no more oranges to pick this year. Any oranges not picked
this year must fall off before next year.

"By the third growing season, these oranges will produce 5 to 25 pounds of fruit.
When it is mature, at about age 10, each type of orange tree can produce over 100 pounds."

dies at 12 years
=end

class OrangeTree
	def initialize
		@height = 2
		@age = 0
		@oranges = 0
		@picked_counter = 0
		puts "The tree is planted."
		height
		query
	end
	def query
		puts "What would you like to do? type: Pick, Count, or Grow"
		@reply = gets.downcase.chomp
		case @reply
			when "pick" then pick_an_orange #not running this method for some reason
			when "count" then count_the_oranges
			when "grow" then grow
				height
			else puts "please type Pick, Count, or Grow"
			query
		end
	end
	def age
		if @age >= 10
			@oranges = 110
		elsif @age >= 8
			@oranges = 85
		elsif @age >= 7
			@oranges = 75
		elsif @age >= 5
			@oranges = 50
		elsif @age >= 3
			@oranges = 25
		else
			@oranges = 0
		end
	end
	def count_the_oranges
		puts "counting..."
		age
		if (age < 3)
			puts "There are no oranges yet. The tree is too young."
			one_year_passes
		else
			if @picked_counter >= 1
				@oranges = @oranges - @picked_counter
			end
			puts "There are #{@oranges} oranges."
		end
		query
	end
	def pick_an_orange
	  age
		puts "picking..."
		if @picked_counter >= 1
			@oranges = @oranges - @picked_counter
		end
		if (@age < 3) || (@oranges < 1)
		  puts "There are no oranges."
		  if @age < 3
				puts "The tree is too young to bear fruit."
				one_year_passes
			else
				puts "We have run out for the year!"
				one_year_passes
		  end
		elsif @oranges >= 50
			puts "This one might be a little young."
		elsif @oranges >= 15
			puts "Juicy and delicious."
		elsif @age > 5
			puts "I think they're a little past their prime."
		else
			puts "This one's pretty good."
		end
		@oranges -= 5
		if @oranges == 0
			puts "We have run out for the year!"
			one_year_passes
		else
			puts "#{@oranges} oranges left!"
			@picked_counter += 5
			query
		end
	end
	private
	def grow
		one_year_passes
	end
	def height
		if @height > 1
			puts "The tree is #{@height} feet tall."
		end
	end
	def one_year_passes
		@height += 1.5
		@picked_counter = 0
		@age += 1
		puts "The tree is now #{@age} years old."
		height
		death
		query
	end
	def death
		if @age >= 12
			puts "Your very old tree dies."
			exit
		end
	end
end

tree = OrangeTree.new
