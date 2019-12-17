# Fix the Program - Books (Part 2)
# Complete this program so that it produces the expected output:
#
# class Book
#   def to_s
#     %("#{title}", by #{author})
#   end
# end
#
# book = Book.new
# book.author = "Neil Stephenson"
# book.title = "Snow Crash"
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)
# Expected output:
#
# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.

class Book
  attr_accessor :title, :author

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.) # => The author of "Snow Crash" is Neil Stephenson.
puts %(book = #{book}.) # => book = "Snow Crash", by Neil Stephenson.

# Further Exploration
# What do you think of this way of creating and initializing Book objects? (The
# two steps are separate.) Would it be better to create and initialize at the
# same time like in the previous exercise? What potential problems, if any, are
# introduced by separating the steps?

This system of assigning title and author after object instantiation causes the
object to be more exposed and vulnerable to manipulation later.
As others point out, it could also lead to an object being created without any
data so any calls to that object would result in nil values.
It seems as though best practice is to assign instance variables on
instantiation using the `initialize` method rather than separate them. 
