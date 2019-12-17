# Fix the Program - Books (Part 1)
# Complete this program so that it produces the expected output:
#
# class Book
#   def initialize(author, title)
#     @author = author
#     @title = title
#   end
#
#   def to_s
#     %("#{title}", by #{author})
#   end
# end
#
# book = Book.new("Neil Stephenson", "Snow Crash")
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)
# Expected output:
#
# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.

class Book
  attr_reader :title, :author

  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.) # => The author of "Snow Crash" is Neil Stephenson.
puts %(book = #{book}.) # => book = "Snow Crash", by Neil Stephenson.

# Further Exploration
# What are the differences between attr_reader, attr_writer, and attr_accessor?
# Why did we use attr_reader instead of one of the other two? Would it be okay
# to use one of the others? Why or why not?

attr_writer would have allowed us to change the title or author of the book but
not access the values to print them as called here (resulting in a NoMethod
error). attr_accessor would have allowed us to both read and write the title and
author, which is more functionality than we need currently and could have
unexpected consequences further down the line (including someone changing the
value of the title or author on purpose or unintentionally).


# Instead of attr_reader, suppose you had added the following methods to this
# class:
#
# def title
#   @title
# end
#
# def author
#   @author
# end
# Would this change the behavior of the class in any way? If so, how? If not,
# why not? Can you think of any advantages of this code?

These methods would have allowed us the same reading ability as the more
efficient attr_reader method. I can not think of any advantages to using this
longer format for the purposes of this script. If we were wanting to format the
data differently for output, these custom getter methods would be required.
